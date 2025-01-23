import 'dart:html';

void main() {
  final taskInput = querySelector('#taskInput') as InputElement;
  final categorySelector = querySelector('#categorySelector') as SelectElement;
  final addTaskButton = querySelector('#addTaskButton') as ButtonElement;
  final taskList = querySelector('#taskList') as DivElement;
  final taskSummary = querySelector('#taskSummary') as ParagraphElement;

  final tasks = <Map<String, dynamic>>[];

  void updateSummary() {
    final totalTasks = tasks.length;
    final completedTasks = tasks.where((task) => task['completed'] == true).length;
    taskSummary.text = '$totalTasks tasks, $completedTasks completed';
  }

  void renderTasks() {
    taskList.innerHtml = '';
    final groupedTasks = {
      'work': tasks.where((task) => task['category'] == 'work').toList(),
      'personal': tasks.where((task) => task['category'] == 'personal').toList(),
    };

    groupedTasks.forEach((category, tasks) {
      if (tasks.isNotEmpty) {
        final categoryDiv = DivElement()..classes.add('task-category');
        categoryDiv.append(HeadingElement.h2()..text = category.toUpperCase());
        tasks.forEach((task) {
          final taskDiv = DivElement()
            ..classes.add('task')
            ..classes.toggle('completed', task['completed'])
            ..append(CheckboxInputElement()
              ..checked = task['completed']
              ..onChange.listen((_) {
                task['completed'] = !task['completed'];
                renderTasks();
                updateSummary();
              }))
            ..append(SpanElement()..text = task['name'])
            ..append(ButtonElement()
              ..text = 'Delete'
              ..onClick.listen((_) {
                tasks.remove(task);
                renderTasks();
                updateSummary();
              }));
          categoryDiv.append(taskDiv);
        });
        taskList.append(categoryDiv);
      }
    });
  }

  addTaskButton.onClick.listen((_) {
    final taskName = taskInput.value?.trim();
    final category = categorySelector.value;

    if (taskName != null && taskName.isNotEmpty && category != null) {
      tasks.add({'name': taskName, 'category': category, 'completed': false});
      taskInput.value = '';
      renderTasks();
      updateSummary();
    }
  });
}
