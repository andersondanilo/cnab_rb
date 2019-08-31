module CnabRb::Return::Cnab240
  class Detail
    attr_accessor :segment_t, :segment_u, :segment_w

    def is_write_off
      [6, 9, 17, 25].include?(@segment_t.movement_code)
    end

    def is_rejected_write_off
      [3, 26, 30].include?(@segment_t.movement_code)
    end

    def movement_code
      @segment_t.movement_code
    end

    def net_amount
      @segment_u.net_amount
    end

    def title_amount
      @segment_t.title_amount
    end

    def paid_amount
      @segment_u.paid_amount
    end

    def tax_amount
      @segment_t.tax_amount
    end

    def iof_amount
      @segment_u.iof_amount
    end

    def discount_amount
      @segment_u.discount_amount
    end

    def abatement_amount
      @segment_u.abatement_amount
    end

    def other_expenses_amount
      @segment_u.other_expenses_amount
    end

    def other_credits_amount
      @segment_u.other_credits_amount
    end

    def document_number
      @segment_t.document_number
    end

    def our_number
      @segment_t.our_number
    end

    def due_date
      @segment_t.due_date
    end

    def credit_date
      @segment_u.credit_date
    end

    def fine_amount
      @segment_u.additions_amount
    end

    def ocurrency_date
      @segment_u.ocurrency_date
    end

    def wallet_code
      if @segment_t.field_exists(:wallet_code)
        @segment_t.wallet_code
      end
    end

    def agency
      @segment_t.agency
    end

    def agency_cd
      @segment_t.agency_cd
    end

    def collector_agency
      @segment_t.collector_agency
    end

    def collector_agency_cd
      @segment_t.collector_agency_cd
    end

    def sequential_number
      @segment_t.sequential_number_batch
    end
  end
end
