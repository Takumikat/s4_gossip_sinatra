#require 'bundler'
#Bundler.require
require "sinatra"
require_relative 'gossip'


class ApplicationController < Sinatra::Base
	get '/' do
  		erb :index
  		#, locals: {gossips: Gossip.all}
	end

	get '/gossips/new' do
		erb :new_gossip
	end	 #Permet la création depuis new_gossip


	post '/gossips/new/' do
 		Gossip.new(params["gossip_author"], params["gossip_content"]).save
 		#	puts "Ceci est le contenu du hash params : #{params}"
  		#	puts "Ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
  		#	puts "Ca doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
  		redirect '/'
	end




	#run! if app_file ==$0
	#plus besoin de cette ligne puisque config.ru crée le serveur local et lance ApplicationController
end
