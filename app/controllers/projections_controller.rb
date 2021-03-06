class ProjectionsController < ApplicationController
  
  def home
  end

  def about
  end

  def help
  end


  def calculateGpaNeededForTargetCumulativeGpa

    
    @gpa_for_target_cumulative_gpa = Projector.calculateGpaNeededForTargetCumulativeGpa(params[:cumulative_gpa], params[:credits_earned], params[:desired_cumulative_gpa], params[:credits_taken_this_semester])
   
    respond_to do |format|
      format.js { render :handlers => [:erb] }
    end
  end
    

  def calculateGpaNeededForTargetMajorGpa

    @gpa_for_target_major_gpa = Projector.calculateGpaNeededForTargetMajorGpa(params[:major_gpa], params[:major_credits_earned], params[:desired_major_gpa], params[:major_credits_taken_this_semester])

    respond_to do |format|
      format.js { render :handlers => [:erb] }
    end
  end


  def calculatePredictedGpas

    @number_of_courses = 7;
    @credits_array = params[:credits]
    @predicted_grade_array = params[:predicted_grade]
    @repeated_grade_array = params[:grade_from_repeated_course]
    @cumulative_gpa = params[:cumulative_gpa]
    @credits_earned = params[:credits_earned]
    @is_major_course_array =  getArrayOfParams("is_major_course",  @number_of_courses);
    @major_gpa = params[:major_gpa]
    @major_credits_earned = params[:major_credits_earned]
    
    logger.debug(@credits_array);
    logger.debug(@predicted_grade_array);
    logger.debug(@repeated_grade_array);
    logger.debug(@is_major_course_array);
    
    

    @predicted_cumulative_gpa = Projector.calculatePredictedCumulativeGpa(@cumulative_gpa, @credits_earned, @credits_array, @predicted_grade_array, @repeated_grade_array)
    @predicted_major_gpa = Projector.calculatePredictedMajorGpa(@major_gpa, @major_credits_earned, @credits_array, @predicted_grade_array, @is_major_course_array,  @repeated_grade_array)

    @predicted_gpas = Array.new
    @predicted_gpas.push(@predicted_cumulative_gpa)
    @predicted_gpas.push(@predicted_major_gpa)

    respond_to do |format|
     format.js { render :handlers => [:erb] }
    end
    
  end

  
  
  def getArrayOfParams(parameter, arrayLength)
  
      arrayOfParams = Array.new
      length = arrayLength.to_i
      
      length.to_i.times do |i|
        is_checked = params[:"#{parameter}#{i.to_s}"]
        
        if(!is_checked.nil?)
          arrayOfParams.push(1)
        else
          arrayOfParams.push(0);
        end
      end

    return arrayOfParams
  end
end