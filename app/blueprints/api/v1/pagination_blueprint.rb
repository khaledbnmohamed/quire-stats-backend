module Api::V1
  class PaginationBlueprint
    def self.render(list)
      {
        per_page: list.limit_value,
        total_pages: list.total_pages,
        total_count: list.total_count,
        current_page: list.current_page,
        next_page: list.next_page,
        prev_page: list.prev_page,
        first_page: list.first_page?,
        last_page: list.last_page?,
        out_of_range: list.out_of_range?
      }
    end
  end
end
