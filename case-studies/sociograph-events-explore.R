
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)
library(lubridate)

events <- read_csv("data/1011464178907468_events.csv", col_types = list(
    id = col_double(),
    name = col_character(),
    description = col_character(),
    start_time = col_datetime(format = ""),
    end_time = col_datetime(format = ""),
    type = col_character(),
    ownerId = col_character(),
    ownerName = col_character(),
    attending_count = col_integer(),
    interested_count = col_integer(),
    declined_count = col_integer(),
    noreply_count = col_integer()
)) %>% 
    mutate(start_time = as.Date(start_time),
           end_time = as.Date(end_time))


# Точки
ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_point() + 
    theme_minimal()

# Столбики во времени
ggplot(events, aes(x = start_time, y = attending_count,  
                   width = as.integer(end_time - start_time))) +
    geom_col(alpha = 0.5) + 
    theme_minimal()

# Столбики между собой
ggplot(events, aes(x = as.factor(start_time), y = attending_count)) +
    geom_col() + 
    theme_minimal()

# Линии
ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_line() + 
    theme_minimal()

ggplot(events, aes(x = start_time)) +
    geom_line(aes(y = attending_count)) + 
    geom_line(aes(y = noreply_count), color = 'red') + 
    theme_minimal()

# Линии и риббоны
ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_line() +
    geom_ribbon(aes(ymin = attending_count, 
                    ymax = attending_count + interested_count), alpha = 0.2) +
    theme_minimal()

# Ступеньки
ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_step() + 
    theme_minimal()

# Точки с подписями
ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_point(color = 'red') + 
    geom_text(aes(label = name), size = 3, hjust = 0, nudge_x = 2) +
    theme_void()

ggplot(events, aes(x = start_time, y = attending_count)) +
    geom_point(color = 'red') +
    geom_label(
        aes(label = name),
        size = 3,
        hjust = 0,
        nudge_x = 2,
        alpha = 0.5,
        label.size = 0
    ) + theme_void()


# ...
# Повторяем идеи дизайнера

# Переформатируем данные для соединения дат старта и конца события
events_longtime <- events %>%
    select(
        id, name,
        start_time,
        end_time,
        attending = attending_count,
        interested = interested_count,
        decline = declined_count,
        noreply = noreply_count
    ) %>%
    mutate(auditory = attending + interested + decline + noreply,
           end_time = if_else(is.na(end_time), as.Date(start_time) + 3, end_time)) %>% 
    gather(key = 'date_type', value = 'date', start_time, end_time) %>% 
    mutate(date = as.Date(date))

# Отрезки во времени
ggplot(events_longtime) +
    geom_line(aes(date, auditory, group = id), size = 1, col = 'red') + theme_minimal()

# Аудитория по дням недели
ggplot(events_longtime %>%
           mutate(weekday = factor(
               wday(date),
               levels = 1:7,
               labels = c('пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс')
           ))) +
    geom_line(aes(weekday, auditory, group = id)) + theme_minimal()


# Переформатируем данные для соединения типов событий на одном графике
events_longcount <- events %>%
    select(
        start_time,
        end_time,
        attending = attending_count,
        interested = interested_count,
        decline = declined_count,
        noreply = noreply_count
    ) %>%
    gather(key = 'category', value = 'count', attending, interested, decline, noreply) %>% 
    mutate(start_time = as.Date(start_time), 
           end_time = if_else(is.na(end_time), as.Date(start_time) + 7, end_time)
           )

# Линии
ggplot(events_longcount, aes(x = start_time, y = count)) +
    geom_line(aes(color = category)) + 
    theme_minimal()

# Штабелированные столбики
ggplot(events_longcount, aes(x = start_time, y = count,  width = as.integer(end_time - start_time))) +
    geom_col(aes(fill = category), alpha = 0.75) + 
    theme_minimal() + scale_fill_viridis_d(direction = -1)

# Столбики рядом
ggplot(events_longcount, aes(x = factor(start_time), y = count)) +
    geom_col(aes(fill = category), position = 'dodge', alpha = 0.5) + 
    theme_minimal()

# Cтолбики друг под другом, но каждый в своём бейзлайне
ggplot(events_longcount, aes(x = start_time, y = count,  width = as.integer(end_time - start_time))) +
    geom_col() + 
    facet_wrap(~ category, nrow = 4) +
    theme_minimal()


# ...

ggplot(events_longcount, aes(x = category, y = count)) +
    geom_boxplot() +
    geom_jitter() + 
    theme_minimal()
