class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  before_filter :authenticate_user!, :except => [:show,:index]
  before_filter :load_basics
  before_filter :check_if_owner, :only => [ :edit ,:update, :delete]
  def index
    @questions = Question.order('created_at desc').paginate(:page => params[:page], :per_page => 8)
    @rescent_answers = Answer.order('created_at desc').limit(4)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
      format.js
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order('rank desc')
    @answer = @question.answers.build
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question ||= Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully posted.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question ||= Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to @question, notice: 'Question was successfully posted.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :ok }
    end
  end
  
  def rank_me
    if @current_user
      if params[:question_id]
        @question = Question.find(params[:question_id])
        @question = Rank.rank_me(@question,params,@current_user.id)
      end
      if params[:answer_id]
        @answer = Answer.find(params[:answer_id])
        @answer = Rank.rank_me(@answer,params,@current_user.id)
      end
    end
  end

  private
  def load_basics
    @current_user = current_user
  end

  def check_if_owner
    @question ||= Question.find(params[:id])
    if current_user.try(:id) != @question.user_id
      respond_to do |format|
        format.html { redirect_to @question, notice: 'You cannot edit this question' }
        format.json { head :ok }
      end
    end
  end
end
