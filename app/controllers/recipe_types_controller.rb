class RecipeTypesController < ApplicationController
    def new 
        @recipe_type = RecipeType.new
    end

    def create 
        @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))
        if @recipe_type.save
            flash[:notice] = "Cadastro feito com sucesso"
            return redirect_to new_recipe_type_path
        else 
        end
        render :new
    end
end