class ListsController < ApplicationController
  def index
    @lists = List.order(:created_at => :desc)

    render("lists_templates/index.html.erb")
  end

  def show
    @lists = List.find(params.fetch("id"))

    render("lists_templates/show.html.erb")
  end

  def new_form
    render("lists_templates/new_form.html.erb")
  end

  def create_row
    @lists = List.new

    @lists.title = params.fetch("some_title")
    @lists.description = params.fetch("some_description")

    @lists.save

    redirect_to("/lists")
  end

  def edit_form
    @lists = List.find(params.fetch("id"))
    render("lists_templates/edit_form.html.erb")
  end

  def update_row
    @lists = List.find(params.fetch("id"))

    @lists.title = params.fetch("title")
    @lists.description = params.fetch("description")

    @lists.save

    redirect_to("/lists/#{@lists.id}")
  end

  def destroy_row
    @lists = List.find(params.fetch("id"))

    @lists.destroy
    redirect_to("/lists")
  end
end
