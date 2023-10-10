Departament.create(name: 'TI', description: 'Tecnologia da Informação')
Category.create(name: 'Developing', description: 'Developing', departament_id: 1, status: true)
Company.create(name: 'Razonet', cnpj: '12345678901234', status: true)

default_image = Rails.root.join('app/assets/images/default-avatar.png')
default_blob = ActiveStorage::Blob.create_and_upload!(
  io: File.open(default_image, 'rb'),
  filename: 'default-avatar.png',
  content_type: 'image/png'
)

User.create(name: 'Admin', email: 'admin@admin.com', departament_id: 1, avatar: default_blob, password: '123456',
            password_confirmation: '123456', admin: true)
User.create(name: 'Luan', email: 'luan.tedesco@razonet.com.br', departament_id: 1, avatar: default_blob, password: 'Lu4036An',
            password_confirmation: 'Lu4036An', admin: false)

Column.create(title: 'Waiting', description: 'Waiting', level: 1, visible: true)
Column.create(title: 'Developing', description: 'Developing', level: 2, visible: true)
Column.create(title: 'Testing', description: 'Testing', level: 3, visible: true)
Column.create(title: 'Ready', description: 'Ready', level: 4, visible: true)
Column.create(title: 'Dead file', description: 'Dead file', level: 5, visible: false)

Priority.create(name: 'Low', description: 'Low', level: 1)
Priority.create(name: 'Moderate', description: 'Moderate', level: 2)
Priority.create(name: 'Important', description: 'Important', level: 3)
Priority.create(name: 'Urgent', description: 'Urgent', level: 4)
