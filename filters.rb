# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.find { |candidate| candidate[:id] == id }
  end

  
  def experienced?(candidate)
    # if experienced > 2
    #   return true
    # else
    #     return false
    candidate[:years_of_experience] >= 2
  end

  
  def qualified_candidates(candidates)
    candidates.filter do |candidate|
      #using experienced method to check if candidate has anough experience (returns true/false)
      experienced?(candidate) &&
      candidate[:github_points] >= 100 &&
      candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python") &&
      candidate[:date_applied] >= 15.days.ago.to_date &&
      candidate[:age] > 17
    end
    
  end
  

  def ordered_by_qualifications(candidates)
    # - sorting in descending order
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end

