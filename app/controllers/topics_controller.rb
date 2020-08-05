class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
    @t_content = @topic.t_contents.build
  end




  def new
    @topic = textbook.topics.build
  end

  def create
    @textbook = Textbook.find(params[:id])
    @topic = @textbook.topics.build(params_topic)
    if @topic.save
      flash[:success] = "topicを追加しました"
      redirect_to textbook_path(@textbook)
    else
      flash.new[:danger] = "topicが追加できませんでした"
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy 
    flash[:success] = "正常に削除されました"
    redirect_back(fallback_location: root_path)
  end

  private
  def params_topic
    params.require(:topic).permit(:title)
  end
end
