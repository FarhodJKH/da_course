# Описание домашнего задания №2 по Git  

1. Создайте репозиторий **git_branches**
2. В репозитории создайте файл *factorial.py*
3. Сохраните и закомитьтесь.
4. Создайте новую ветку ***recursive*** но пока не переходите на неё
5. Вставьте в файл *factorial.py* следующий код:
```
def factorial(n, method="iterative"):
    if method == "iterative":
        result = 1
        for i in range(1, n + 1):
            result *= i
        return result
    else:
        # Placeholder for recursive method
        pass

if __name__ == "__main__":
    number = 5
    method = input("Choose method (iterative/recursive): ").strip().lower()
    print(f"Factorial of {number} is {factorial(number, method)}")
```
6. Сохраните изменения и закомитьте
7. Перейдите на ветку ***recursive***
8. Вставьте в файл следующий код:
```
def factorial(n, method="iterative"):
    if method == "recursive":
        if n == 0 or n == 1:
            return 1
        else:
            return n * factorial(n - 1, method="recursive")
    else:
        # Placeholder for iterative method
        pass

if __name__ == "__main__":
    number = 5
    method = input("Choose method (iterative/recursive): ").strip().lower()
    print(f"Factorial of {number} is {factorial(number, method)}")
```
9. Сохраните изменения и закомитьте
10. Вернитесь на ветку ***main***
11. Произведите слияние основной ветки с веткой ***recursive***
12. Разрешите возникший конфликт (подсказка - этот конфликт вам придётся решать вручную)
13. Закомитьте результат `но не удаляйте` ветку ***recursive***
14. Перенесите репозиторий `с обеими ветками` на github сделав его публичным
15. Прикрепите ссылку на этот репозиторий.


# Домашка по SQL  

1. Создайте многострочный комментарий со следующей информацией:
   * ваши имя и фамилия
   * описание задачи 
3. Напишите код, который вернёт из таблицы `track` поля *name* и *genreid*
4. Напишите код, который вернёт из таблицы `track` поля *name*, *composer*, *unitprice*. Переименуйте поля на *song*, *author* и *price* соответственно. Расположите поля так, чтобы сначало следовало название произведения, далее его цена и в конце список авторов.
5. Напишите код, который вернёт из таблицы `track` название произведения и его длительность в минутах. Результат должен быть отсортирован по длительности произведения по убыванию.
6. Напишите код, который вернёт из таблицы `track` поля *name* и *genreid*, и **только первые 15 строк**.
7. Напишите код, который вернёт из таблицы `track` все поля и все строки начиная **с 50-й строки**.
8. Напишите код, который вернёт из таблицы `track` названия всех произведений, чей объём **больше 100 мегабайт**.
9. Напишите код, который вернёт из таблицы `track` поля name и composer, где composer **не равен "U2"**. Код должен вернуть записи **с 10 по 20-й включительно**.
10. Напишите код, который из таблицы `invoice` вернёт дату самой первой и самой последней покупки.
11. Напишите код, который вернёт размер среднего чека для покупок из **США**.
12. Напишите код, который вернёт список городов в которых имеется **более одного клиента**.

В репозитории, который вы создавали для предыдущего урока, создайте новую ветку и сохраните файл с кодом решения перечисленных задач в эту ветку.  
Сделайте коммит, пуш и создайте pull request.  
В классруме прикрепите скриншот вкладки `files changed` вашего pull request-а.
