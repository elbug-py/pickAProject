class ProjectsController < ApplicationController
    
    # GET /projects
    def index
        @projects = Project.all
    end

    # GET /projects/:id
    def show
    end

    # GET /projects/new
    def new
        @project = Project.new
    end

    # POST /projects
    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to @project
        else
            render 'new'
        end
    end
end
