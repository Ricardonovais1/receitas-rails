class RecipesController < ApplicationController
    def show
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new
    end

    def create 
        @recipe = Recipe.new(params.require(:recipe).permit(:name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time, :status))
        

        if @recipe.save
            flash[:notice] = "Receita cadastrada com sucesso!"
            return redirect_to recipe_path(@recipe.id)
        else 
            flash[:notice] = "Houve um problema para cadastrar a receita"
        end
        render :new
    end

    def edit 
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(params.require(:recipe).permit(:name, :recipe_type_id, :cuisine, :ingredients, :cook_method, :cook_time, :status))
        
        
            flash[:notice] = "Receita atualizada com sucesso"
            return redirect_to recipe_path(@recipe.id)
        else 
            flash[:notice] = "Houve um problema para atualizar a receita"
        end
    end

    def publish 
        recipe = Recipe.find(params[:id])
        recipe.published!
        redirect_to recipe_path(recipe.id)
    end

    def unpublish 
        recipe = Recipe.find(params[:id])
        recipe.draft!
        redirect_to recipe_path(recipe.id)
    end
end