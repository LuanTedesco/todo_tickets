var checkbox = document.querySelectorAll('.checkbox-toggle')

checkbox.forEach(function (sub_task) {
  sub_task.addEventListener('click', function (e) {
    var form_sub_task = this.parentNode
    form_sub_task.submit()
  })
})
