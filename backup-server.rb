require 'erb'
require 'fileutils'
require 'sinatra'

BACKUP_DIR = (ENV.include?('BACKUP_DIR') ? ENV['BACKUP_DIR'] : './temp')
FileUtils.mkdir_p BACKUP_DIR unless File.exists?(BACKUP_DIR)

set :bind, (ENV.include?('BIND_ADDRESS') ? ENV['BIND_ADDRESS'] : '0.0.0.0')
set :port, (ENV.include?('BIND_PORT') ? ENV['BIND_PORT'] : '4567')

configure { set :server, :puma }

configure :development do
  get '/upload' do
    erb :upload
  end
end

not_found do
  headers "Content-Type" => "text/html"
  '<h1>404</h1>'
end

get '/' do
  not_found
end

get '/backup/*.sql' do |file|
  not_found
end

post '/' do
  now = Time.now
  file = params[:file][:tempfile]

  File.open("#{BACKUP_DIR}/#{now.strftime("%Y-%m-%d_%H-%M-%S")}.sql", 'wb') do |f|
    f.write(file.read)
  end
  
  nil
end