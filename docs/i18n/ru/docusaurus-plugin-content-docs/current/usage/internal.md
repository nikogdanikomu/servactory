---
title: Внутренние атрибуты сервиса
slug: /usage/internal
sidebar_label: Internal
sidebar_position: 6
pagination_label: Внутренние атрибуты сервиса
---

# Internal

Внутренние приватные атрибуты можно определять через метод `internal`.

## Опции

### Опция `type`

Эта опция является валидацией.
Будет проверяться чтобы переданное в `internal` значение соответствовало указанному типу (классу).
Используется метод `is_a?`.

```ruby
class NotificationService::Create < ApplicationService::Base
  input :user, type: User

  # highlight-next-line
  internal :inviter, type: User
  
  output :notification, type: Notification

  make :assign_inviter
  make :create_notification!
  
  private
  
  def assign_inviter
    # highlight-next-line
    self.inviter = user.inviter
  end
  
  def create_notification!
    self.notification = Notification.create!(user: inputs.user, inviter:)
  end
end
```
