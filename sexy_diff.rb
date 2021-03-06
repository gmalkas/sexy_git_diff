require 'sinatra'
require 'grit'

require './diff_presenter'

helpers do
	include Rack::Utils
	alias_method :h, :escape_html
end

get '/' do
	repository = params[:repository]

	if repository && !repository.empty?
		files = params[:files].split($/).map { |f| f.strip } if !params[:files].empty?
		
		@repo = Grit::Repo.new(repository)

		@from_sha = (params[:from_commit].empty?) ? @repo.commits.last.sha : params[:from_commit]
		@to_sha = (params[:to_commit].empty?) ? @repo.commits.first.sha : params[:to_commit]
		@diffs = @repo.diff(@from_sha, @to_sha, *files)
		@diff_presenters = @diffs.map { |d| DiffPresenter.new(d) }
  end
  erb :index
end
