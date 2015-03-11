@Form ||= {}
jQuery.extend @Form,
  init: ->
    Form.formEvents()

  formEvents: ->
    $datepicker = $('#applicant_birthdate')
    $datepicker.datepicker dateFormat: 'yy-dd-mm'

    checkFriendIsSelected = (target) ->
      if target.val() == 'Friend'
        $('#applicant_job_preference_attributes_firstname').show()
        $('#applicant_job_preference_attributes_lastname').show()
        $('#job_pref_firstname').show()
        $('#job_pref_lastname').show()
      else
        $('#applicant_job_preference_attributes_firstname').hide()
        $('#applicant_job_preference_attributes_lastname').hide()
        $('#job_pref_firstname').hide()
        $('#job_pref_lastname').hide()
      return

    checkIfSpecifyIsChecked = (target) ->
      bool = target.is(':checked')
      if bool
        $('#applicant_job_preference_attributes_source_sub').show()
        $('#applicant_job_preference_attributes_source').hide()
        $('#source_label').hide()
      else
        $('#applicant_job_preference_attributes_source_sub').hide()
        $('#applicant_job_preference_attributes_source').show()
        $('#source_label').show()
      return

    checkIfSpecifyIsChecked $('#specify_other')
    checkFriendIsSelected $('#applicant_job_preference_attributes_source')
    $('#applicant_job_preference_attributes_source').change ->
      checkFriendIsSelected $(this)
      return
    $('#specify_other').click ->
      checkIfSpecifyIsChecked $(this)
      return
