class Champs::DropDownListChamp < Champ
  THRESHOLD_NB_OPTIONS_AS_RADIO = 5

  def render_as_radios?
    enabled_non_empty_options.size <= THRESHOLD_NB_OPTIONS_AS_RADIO
  end

  def options?
    drop_down_list_options?
  end

  def options
    drop_down_list_options.filter { |option| option.casecmp('autre') != 0 } | [value]
  end

  def disabled_options
    drop_down_list_disabled_options
  end

  def enabled_non_empty_options
    drop_down_list_enabled_non_empty_options
  end

  def allows_other_value?
    drop_down_list_options.find { |option| option.casecmp('autre') == 0 }
  end
end
