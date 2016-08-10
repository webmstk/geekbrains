class Context

  @initialize: ->
    console.log "[Context]: Context initialize"
    window.context = new Context

  constructor: ->
    console.log "[Context]: Context app object created"
    @handleEmptyTasks()
    do @handleFilledTasks
    do @handleContextTask

  handleEmptyTasks: ->
    $(document).on 'click', '.tasks__next__empty-element', ->
      content = prompt 'Напишите содержание задачи'
      if content
        $.post '/tasks', content: content, (answer) =>
          if answer.success
            console.log '[Context]: Created task'
            $(this).html content
            $(this).data('id', answer.id)
            $(this).removeClass 'tasks__next__empty-element'
            $(this).addClass 'tasks__next__filled-element'
          else
            alert 'Задача не создана, но почему?!'

  handleFilledTasks: ->
    handleContextTask = @handleContextTask
    contextElement = $('.tasks__context__element')
    $(document).on 'click', '.tasks__next__filled-element', ->
      id = $(this).data 'id'
      $.post '/tasks/' + id + '/incontext', {}, (answer) =>
        if answer.success
          console.log "[Context]: Task #{id} was set in context"
          contextElement.html answer.content
          contextElement.append '<div class="tasks__context__progress m-hide"></div>'
          contextElement.data 'progress', 0
          contextElement.data 'id', id
          $('.tasks__context__progress').html '0%'
          $('.tasks__context__progress').removeClass 'm-hide'
          $(this).removeClass 'tasks__next__filled-element'
          $(this).addClass 'tasks__next__empty-element'
          $(this).html '+'
          do handleContextTask
        else
          alert 'Ваш контекст уже установлен'

  handleContextTask: ->
    context  = $('.tasks__context__progress')
    progress = $('.tasks__context__element').data('progress')

    unless progress == ''
      context.removeClass 'm-hide'
      context.html progress + '%'
      $(document).on 'click', '.tasks__context__element', ->
        id = $(this).data 'id'
        $.post '/tasks/' + id + '/step', {}, (answer) =>
          $('.tasks__context__element').data 'progress', answer.progress
          context.html answer.progress + '%'
          if answer.completed
            context.html ''
            context.addClass 'm-hide'
            $('.tasks__context__element').html '<div class="tasks__context__progress m-hide"></div>'
            $(document).off 'click', '.tasks__context__element'

window.Context = Context
