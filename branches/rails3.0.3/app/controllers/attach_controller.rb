class AttachController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
  before_filter :check_permission, :except => [:read]

  def fetch
    render :text => params[:path], :layout => false
  end
  
  def show
    @attachment = Attachment.newEmpty(flash[:upload_path] || Time.now.strftime('%Y/%m/%d'))
    @all_attachments = Attachment.allFromPath([]).sort_by { |att| att.path.join('/') }.reverse
  end

  def upload
    @attachment = Attachment.fromParams(params[:attachment])
    if @attachment.valid?
      @attachment.store
      flash[:upload] = {:status => :ok, :message => 'Upload completed.'}
    else
      flash[:upload_path] = @attachment.upload_path
      errors = @attachment.errors.full_messages.each do |msg|
        r = Regexp.new(BorgConfig[:max_upload_size].to_s)
        msg[r] = number_to_human_size(BorgConfig[:max_upload_size]) if r.match(msg)
      end
      flash[:upload] = {:status => :error, :errors => errors}
    end
    redirect_to :action => 'show'
  end
  
  def delete
    @attachment = Attachment.fromParams(:upload_path => path_from_params.join('/'))
    @attachment.delete
    flash[:upload] = {:status => :ok, :message => "#{@attachment.upload_path} deleted."}
    redirect_to :action => 'show'
  end

  def check_permission
    unless session[:user_id] && session[:user_id].is_editor
      flash[:error] = "You don't have the rights to manage uploads. Please login with an authorized user."
      redirect_to root_path
    end
  end  
end