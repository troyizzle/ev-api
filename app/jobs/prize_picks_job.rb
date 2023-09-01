require 'puppeteer-ruby'

class PrizePicksJob < ApplicationJob
  queue_as :default

  def perform
    data = nil

    Puppeteer.launch do |browser|
      page = browser.new_page

      # Get a session
      page.set_user_agent('Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0')
      page.goto('https://prizepicks.com')

      data = page.evaluate(<<~JAVASCRIPT)
        async () => {
          try {
            const response = await fetch('https://api.prizepicks.com/projections');
            const data = await response.json();
            return data;
          } catch (error) {
            console.error(error);
            return null;
          }
        }
      JAVASCRIPT

      browser.close

      data['data'].each do |projection|
        player_data = data['included'].find { |i| i['id'] == projection['relationships']['new_player']['data']['id'] }

        player = PrizePicks::Player.find_or_initialize_by(api_id: player_data['id']).tap do |player|
          player.data = player_data['attributes']
          player.save!
        end

        player.projections.find_or_initialize_by(api_id: projection['id']).tap do |proj|
          proj.data = projection['attributes']
          proj.save!
        end
      end
    end
  end
end
