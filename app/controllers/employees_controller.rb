class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end
    
    def show
        redirect_to action: 'index'
      end

    def new
        @employee= Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.new(employee_params)
        @employees = Employee.all
        if @employee.save
            SLACK_NOTIFIER.ping ("Novo membro do time: #{@employee.nome}")
            redirect_to @employee
        else
            render 'new'
        end
    end

    def update
        @employee = Employee.find(params[:id])
       
        if @employee.update(employee_params)
          redirect_to 'index'
        else
          render 'edit'
        end
      end
      
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        
        redirect_to employees_path
    end

    private
        def employee_params
            params.require(:employee).permit(:nome, :email, :cargo, :salário)
        end
end
