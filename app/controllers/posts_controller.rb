class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		flash[:success] = "Post publicado com sucesso" if @post.save
		redirect_to @post
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		flash.notice = "! Post '#{@post.titulo}' atualizado !"
		redirect_to post_path(@post)
	end

	def show
		@post = Post.find(params[:id])

		@comentario = Comentario.new
		@comentario.post_id = @post.id

		@lead = Lead.new
	end

	def index
		@posts = Post.all.order('created_at DESC')
		@lead = Lead.new
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash.notice = "! Post '#{@post.titulo}' Post deletado !"
		redirect_to root_url
	end

	private
		def post_params
			params.require(:post).permit(:titulo, :corpo)
		end
end
