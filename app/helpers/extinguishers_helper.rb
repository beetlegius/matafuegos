module ExtinguishersHelper

  def extinguisher_tr_class(extinguisher)
    case extinguisher.expiration_at
    when (Date.today..1.week.from_now) then 'danger'
    when (Date.today..Extinguisher::EXPIRATION_LIMIT) then 'warning'
    end
  end

  def extinguisher_label_class(extinguisher)
    case extinguisher.kind
    when Extinguisher::A then 'label label-primary'
    when Extinguisher::AB then 'label label-info'
    when Extinguisher::ABC then 'label label-warning'
    when Extinguisher::BC then 'label label-success'
    when Extinguisher::D then 'label label-default'
    when Extinguisher::K then 'label label-danger'
    end
  end
end
