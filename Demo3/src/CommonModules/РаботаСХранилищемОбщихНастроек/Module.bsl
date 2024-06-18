////////////////////////////////////////////////////////////////////////
// Модуль поддерживает работу с хранилищем общих настроек

// Загрузка параметров подключения драйвера сканера из хранилища настроек. 
// 
// Параметры: 
//  ТипОС           – Строка – тип операционной системы.  (IN)
// 
// Возвращаемое значение: 
//  Структура, содержащая параметры подключения сканера
Функция ЗагрузитьПараметрыПодключенияСканера(ТипОС) Экспорт

	Если ТипОС = "Windows" Тогда
		
		Возврат ХранилищеОбщихНастроек.Загрузить("ТекущиеНастройкиСканераWindows");
		
	ИначеЕсли ТипОС = "Linux" Тогда
	
		Возврат ХранилищеОбщихНастроек.Загрузить("ТекущиеНастройкиСканераLinux");
		
	КонецЕсли;

КонецФункции

// Получение каталога, используемого для расположения локальных файлов
// Возвращаемое значение: 
//  Строка, содержащая каталог
Функция ПолучитьРабочийКаталог() Экспорт

	Возврат ХранилищеОбщихНастроек.Загрузить("РабочийКаталогПользователя");

КонецФункции

// Сохранение каталога, используемого для расположения локальных файлов
// Параметры: 
//  Строка, содержащая каталог
Процедура СохранитьРабочийКаталог(Каталог) Экспорт
	
	ХранилищеОбщихНастроек.Сохранить("РабочийКаталогПользователя",,Каталог);	

КонецПроцедуры

// Получение строки, которая будет установлена в качестве краткого заголовка приложения
Функция ПолучитьТекстКраткогоЗаголовкаПриложения() Экспорт

	КраткийЗаголовок = ХранилищеОбщихНастроек.Загрузить("КраткийЗаголовокПриложения");
	Возврат ?(КраткийЗаголовок = Неопределено, "", КраткийЗаголовок);

КонецФункции

// Сохранение строки, установленной в качестве краткого заголовка приложения
Процедура СохранитьТекстКраткогоЗаголовкаПриложения(СтрокаЗаголовока) Экспорт

	ХранилищеОбщихНастроек.Сохранить("КраткийЗаголовокПриложения", , СтрокаЗаголовока);

КонецПроцедуры

// Получение варианта периода для календаря встреч
Функция ПолучитьВариантПериодаКалендаряВстреч() Экспорт

	период = ХранилищеОбщихНастроек.Загрузить("ВариантПериодаКалендаряВстреч");
	Возврат ?(период = Неопределено, "День", период);

КонецФункции

// Сохранение варианта периода для календаря встреч
Процедура СохранитьВариантПериодаКалендаряВстреч(ВариантПериода) Экспорт

	ХранилищеОбщихНастроек.Сохранить("ВариантПериодаКалендаряВстреч", , ВариантПериода);

КонецПроцедуры

// Получение флага отображения встреч других пользователей
Функция ПолучитьОтображениеВстречДругихПользователей() Экспорт

	Отображение = ХранилищеОбщихНастроек.Загрузить("ОтображениеВстречДругихПользователей");
	Возврат ?(Отображение = Неопределено, Ложь, Отображение);

КонецФункции

// Сохранение флага отображения встреч других пользователей
Процедура СохранитьОтображениеВстречДругихПользователей(Отображение) Экспорт

	ХранилищеОбщихНастроек.Сохранить("ОтображениеВстречДругихПользователей", , Отображение);

КонецПроцедуры
