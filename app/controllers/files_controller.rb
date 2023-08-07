class FilesController < ApplicationController
  def destroy
    files = ActiveStorage::Attachment.find(params[:id])
    files.purge
    redirect_back fallback_location: root_path, notice: "success"
  end
end