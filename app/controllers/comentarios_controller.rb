class ComentariosController < ApplicationController
    def create
        @post = Post.find(params[:post_id])

        @comentario = Comentario.new(comentario_params)
        @comentario.post_id = params[:post_id]
        @comentario.save
        redirect_to post_path(@comentario.post_id)
    end

    private
        def comentario_params
            params.require(:comentario).permit(:comentador, :comentario)
        end
end