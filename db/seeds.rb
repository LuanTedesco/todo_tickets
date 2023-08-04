User.create(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')

Column.create(title: 'Aguardando', description: 'Aguardando', level: 1, visible: true)
Column.create(title: 'Desenvolvendo', description: 'Desenvolvendo', level: 1, visible: true)
Column.create(title: 'Testando', description: 'Testando', level: 1, visible: true)
Column.create(title: 'Pronto', description: 'Pronto', level: 1, visible: true)
Column.create(title: 'Arquivo Morto', description: 'Arquivo Morto', level: 1, visible: false)

Priority.create(name: 'Baixa', description: 'Baixa', level: 1)
Priority.create(name: 'Média', description: 'Media', level: 2)
Priority.create(name: 'Alta', description: 'Alta', level: 3)
Priority.create(name: 'Urgente', description: 'Urgente', level: 4)