---
title: Service result
slug: /usage/result
sidebar_label: Result
sidebar_position: 3
pagination_label: Service result
---

# Result

All services have the result of their work. For example, in case of success this call:

```ruby
service_result = UsersService::Accept.call!(user: User.first)
```

Will return this:

```ruby
#<Servactory::Result:0x0000000107ad9e88 @user="...">
```

And then work with thе result in this way:

```ruby
Notification::SendJob.perform_later(service_result.user.id)
```
