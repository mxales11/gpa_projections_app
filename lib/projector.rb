class Projector

	def self.gradingSchema()
  		{ "A" => 4.0, "AB" => 3.5, "B" => 3.0, "BC" => 2.5, "C" =>2.0, "CD" =>1.5, "D"=> 1.0, "F" => 0.0 }
	end

	def self.calculateGpaNeededForTargetCumulativeGpa(cumulative_gpa, credits_earned, target_gpa, credits_taken_this_semester) 

		all_possible_hpts = (credits_earned.to_f + credits_taken_this_semester.to_f) * Projector.gradingSchema()["A"]
		htps_earned = credits_earned.to_f * cumulative_gpa.to_f
		gpaNeededForTargetCumulativeGpa = (target_gpa.to_f * all_possible_hpts.to_f)/(Projector.gradingSchema()["A"] *credits_taken_this_semester.to_f) - (htps_earned.to_f/credits_taken_this_semester.to_f)
			
		return gpaNeededForTargetCumulativeGpa;
		

	end
		

	def self.calculateGpaNeededForTargetMajorGpa(major_gpa, major_credits_earned, target_major_gpa, major_credits_taken_this_semester) 

		
		all_possible_major_hpts = (major_credits_earned.to_f + major_credits_taken_this_semester.to_f) * Projector.gradingSchema()["A"]
		major_hpts_earned = major_credits_earned.to_f * major_gpa.to_f

		majorGpaNeededForTargetCumulativeGpa = (target_major_gpa.to_f * all_possible_major_hpts.to_f)/(Projector.gradingSchema()["A"] * major_credits_taken_this_semester.to_f) - (major_hpts_earned.to_f/major_credits_taken_this_semester.to_f)
			
		return majorGpaNeededForTargetCumulativeGpa;

	end


	def self.calculatePredictedCumulativeGpa(cumulative_gpa, credits_earned, credits_array, predicted_grade_array, is_repeated_course_array, repeated_course_grade_array)

		
		predicted_cumulative_hpts_earned = 0
		predicted_cumulative_credits_earned = 0


		[predicted_grade_array, credits_array, is_repeated_course_array, repeated_course_grade_array].transpose.each do |predicted_grade, credits, is_repeated_course, repeated_course_grade|
  		 
	  		if (predicted_grade.to_s != "-")
	  			if(is_repeated_course.to_i == 1)
	  				predicted_cumulative_hpts_earned = credits.to_i * Projector.gradingSchema()[predicted_grade.to_s] - (credits.to_i * Projector.gradingSchema()[repeated_course_grade.to_s])+ predicted_cumulative_hpts_earned
	  			else
	  				predicted_cumulative_hpts_earned = credits.to_i * Projector.gradingSchema()[predicted_grade.to_s] + predicted_cumulative_hpts_earned
	  				predicted_cumulative_credits_earned = credits.to_i + predicted_cumulative_credits_earned
	  			end
	  			
	  		end	
  		end
	

		cumulative_hpts = predicted_cumulative_hpts_earned + credits_earned.to_f * cumulative_gpa.to_f
		all_possible_hpts = (credits_earned.to_f + predicted_cumulative_credits_earned) * Projector.gradingSchema()["A"]

		predicted_cumulative_gpa =  Projector.gradingSchema()["A"] * (cumulative_hpts / all_possible_hpts)

		return predicted_cumulative_gpa

	end

	def self.calculatePredictedMajorGpa(major_gpa, major_credits_earned, credits_array, predicted_grade_array, is_major_course_array, is_repeated_course_array, repeated_course_grade_array)

		predicted_major_hpts_earned = 0
		predicted_major_credits_earned = 0

		[credits_array, predicted_grade_array, is_major_course_array, is_repeated_course_array, repeated_course_grade_array].transpose.each do |credits, predicted_grade, is_major_course, is_repeated_course, repeated_course_grade|
			if (predicted_grade.to_s != "-" and credits.to_s != "-")
				if (is_major_course.to_i == 1) 
					predicted_major_hpts_earned_for_this_course =  credits.to_i * Projector.gradingSchema()[predicted_grade.to_s]
					if(is_repeated_course.to_i == 1 and repeated_course_grade.to_s != "-")
						predicted_major_hpts_earned_for_this_course_before = credits.to_i * Projector.gradingSchema()[repeated_course_grade.to_s]
						predicted_major_hpts_earned =  predicted_major_hpts_earned_for_this_course - predicted_major_hpts_earned_for_this_course_before + predicted_major_hpts_earned
					else	
		  				predicted_major_hpts_earned = predicted_major_hpts_earned_for_this_course + predicted_major_hpts_earned
		  				predicted_major_credits_earned = credits.to_i + predicted_major_credits_earned
	  				end
	  			end
	  		end
	  	end

		cumulative_major_hpts = predicted_major_hpts_earned + major_credits_earned.to_i * major_gpa.to_f
		all_possible_major_hpts = (major_credits_earned .to_i + predicted_major_credits_earned) * Projector.gradingSchema()["A"]

		predicted_major_gpa =  Projector.gradingSchema()["A"] * (cumulative_major_hpts / all_possible_major_hpts)

		return predicted_major_gpa
	
	end


end