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
		if @post.update_attributes(post_params)
			flash[:success] = "! Post atualizado !"
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.paginate(page: params[:page])
	end

	def destroy
		Post.find(params[:id]).destroy
		flash[:success] = "! Post deletado !"
		redirect_to root_url
	end

	private
		def post_params
			params.require(:post).permit(:titulo, :corpo)
		end
end
