class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :company_name, :start_from, :leave_on, :job_type
end
