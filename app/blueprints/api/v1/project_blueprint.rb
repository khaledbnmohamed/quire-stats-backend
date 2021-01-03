module Api::V1
  class ProjectBlueprint < Blueprinter::Base
    identifier :id

    fields :name, :quire_oid, :quire_id
  end
end
