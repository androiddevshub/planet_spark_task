class ShortUrls < Api
	format :json
	default_format :json

	namespace :short_urls, desc: 'Bags related CRUD operations' do

    desc 'A test end-point'
    get '/test' do
      { status_code: true,  message: 'Test api response successful' }
		end

		desc 'Get all Short Urls'
    get '/' do
      @short_urls = ShortUrl.all
      puts "#{params}"
      array = []
      @short_urls.each do |short_url|
        array << {
          url: short_url.url,
          short_url: short_url.shorten_url
        }
      end
      if !@short_urls.empty?
        { data: array, status_code: true }
      else
        error!({ status_code: false, message: 'Short url list is empty' }, 400)
      end
		end

    desc 'Create new short url'
    params do
      requires :url, type: String, desc: 'Url'
    end
    post '/' do
      @short_url = ShortUrl.new(params)
      if @short_url.save!
        { data: @short_url, message: 'Short url created successfully.', status_code: true}
      else
        error!({ status: false, message: @short_url.errors.full_messages.join(', ') }, 400)
      end
		end
	

	
	end
end