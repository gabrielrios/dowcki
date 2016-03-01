class CodeObjectsController < ApplicationController
  def show
    @code_object = CodeObject.find(params[:id])
  end
end
