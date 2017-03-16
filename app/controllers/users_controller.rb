class UsersController < ApplicationController
  require 'open3'


  def new
    @user=User.new
  end


  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to '/activation'
    else
      render 'new'
    end
  end


  def user_params

    params.require(:user).permit(:first_name,:last_name, :email, :email_confirmation,:password)
  end






  def compile
    @arr =""
    @code =params['code']

    # retrieve user id and check if directory exists
    path='users/'+current_user[:id].to_s
    FileUtils.mkdir_p(path) unless File.exists?(path)


    out_file= File.new(path+'/temp.c', 'w')
    out_file.write @code
    out_file.close
    %x(gcc -o #{path}/prog #{path}/temp.c 2> #{path}/out.txt)


    File.open(path+'/out.txt','r') do |fichier|

      fichier.each do|line|
        @arr+="\n"+line
      end
    end

    File.delete path+'/temp.c'
    File.delete path+'/out.txt'

    if @arr.empty?
      exec=@current_user.execs.create
      File.rename(path+"/prog", path+"/"+exec[:id].to_s)
      @arr=true



    end

    render 'show'


  end

  def generated
    @my_execs=current_user.execs
  end




  def upload

    @arr =""

    # get the path to user's files and create it if it doesn't exist
    path='users/'+current_user[:id].to_s
    FileUtils.mkdir_p(path) unless File.exists?(path)

    # saving file to be compiled
    File.open(path+'/temp.c', "wb") { |f| f.write(params['code_source'].read)}

    # compile the file
    %x(gcc -o #{path}/prog #{path}/temp.c 2> #{path}/out.txt)


    # read errors if there are any
    File.open(path+'/out.txt','r') do |fichier|
      fichier.each do|line|
        @arr+="\n"+line
      end
    end

    # delete both temporary files
    File.delete path+'/temp.c'
    File.delete path+'/out.txt'


    # case when compilation goes well
    if @arr.empty?
      # create entry in exec table that belongs to the current user
      exec=@current_user.execs.create

      # rename the executable program  with its corresponding id
      File.rename(path+"/prog", path+"/"+exec[:id].to_s)
      @arr=true
    end

    render 'show'

  end

end
