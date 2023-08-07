Departament.create(name: 'TI', description: 'Tecnologia da Informação')
Company.create(name: 'Razonet', cnpj: '12345678901234', status: true)
Category.create(name: 'Desenvolvimento', description: 'Desenvolvimento', status: true)

User.create(name: 'Admin', email: 'admin@admin.com', departament_id: 1, password: '123456',
            password_confirmation: '123456', admin: true)

Column.create(title: 'Aguardando', description: 'Aguardando', level: 1, visible: true)
Column.create(title: 'Desenvolvendo', description: 'Desenvolvendo', level: 2, visible: true)
Column.create(title: 'Testando', description: 'Testando', level: 3, visible: true)
Column.create(title: 'Pronto', description: 'Pronto', level: 4, visible: true)
Column.create(title: 'Arquivo Morto', description: 'Arquivo Morto', level: 5, visible: false)

Priority.create(name: 'Baixa', description: 'Baixa', level: 1)
Priority.create(name: 'Média', description: 'Media', level: 2)
Priority.create(name: 'Alta', description: 'Alta', level: 3)
Priority.create(name: 'Urgente', description: 'Urgente', level: 4)
