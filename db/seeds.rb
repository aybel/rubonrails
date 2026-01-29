# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seeds para catálogos
Currency.create!([
	{ code: "USD", name: "Dólar Estadounidense", symbol: "$", exchange_rate: 1.0, is_base: false, active: true },
	{ code: "EUR", name: "Euro", symbol: "€", exchange_rate: 1.0, is_base: false, active: true },
	{ code: "MXN", name: "Peso Mexicano", symbol: "$", exchange_rate: 1.0, is_base: false, active: true }
])

PaymentTerm.create!([
	{ code: "IMMEDIATE", name: "Pago Inmediato", days: 0, description: "Pago Inmediato", active: true },
	{ code: "NET15", name: "Pago a 15 días", days: 15, description: "Pago a 15 días", active: true },
	{ code: "NET30", name: "Pago a 30 días", days: 30, description: "Pago a 30 días", active: true },
	{ code: "NET45", name: "Pago a 45 días", days: 45, description: "Pago a 45 días", active: true },
	{ code: "NET60", name: "Pago a 60 días", days: 60, description: "Pago a 60 días", active: true },
	{ code: "NET90", name: "Pago a 90 días", days: 90, description: "Pago a 90 días", active: true }
])

SupplierType.create!([
	{ code: "RAW_MAT", name: "Materia Prima", description: "Proveedores de insumos directos para producción.", active: true },
	{ code: "PACK", name: "Empaque", description: "Proveedores de materiales para embalaje y empaque.", active: true },
	{ code: "CHEM", name: "Químicos", description: "Proveedores de productos químicos para el proceso.", active: true },
	{ code: "SERV", name: "Servicios", description: "Proveedores de servicios como mantenimiento, logística, etc.", active: true },
	{ code: "EQUIP", name: "Equipamiento y Repuestos", description: "Proveedores de maquinaria, equipos y refacciones.", active: true },
	{ code: "INDIRECT", name: "Indirectos", description: "Proveedores de bienes y servicios no relacionados directamente con la producción (ej. oficina).", active: true }
])

SupplierStatus.create!([
	{ code: "ACTIVE", name: "Activo", description: "Proveedor aprobado y operativo.", active: true },
	{ code: "SUSPENDED", name: "Suspendido", description: "Proveedor temporalmente inhabilitado para nuevas órdenes.", active: true },
	{ code: "INACTIVE", name: "Inactivo", description: "Proveedor que ya no forma parte de la cadena de suministro.", active: true },
	{ code: "EVALUATING", name: "En Evaluación", description: "Proveedor potencial en proceso de calificación.", active: true },
	{ code: "REJECTED", name: "Rechazado", description: "Proveedor que no cumplió con los criterios de calificación.", active: true }
])

# Seeds para suppliers (sin primary_contact_id)
suppliers_seed = [
	{ code: "SUP-001", name: "Celulosa Internacional S.A.", tax_id: "RFC-CEL-001", supplier_type_id: 1, supplier_status_id: 1, quality_score: 0.95, delivery_score: 0.92, payment_term_id: 4, currency_id: 1, credit_limit: 500000.00, notes: "Proveedor principal de celulosa kraft blanqueada", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-002", name: "Pulpa y Fibras del Norte", tax_id: "RFC-PFN-002", supplier_type_id: 1, supplier_status_id: 1, quality_score: 0.88, delivery_score: 0.90, payment_term_id: 3, currency_id: 3, credit_limit: 300000.00, notes: "Proveedor regional de pulpa mecánica", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-003", name: "Reciclados Papel Verde", tax_id: "RFC-RPV-003", supplier_type_id: 1, supplier_status_id: 1, quality_score: 0.82, delivery_score: 0.85, payment_term_id: 2, currency_id: 3, credit_limit: 150000.00, notes: "Especialista en papel reciclado de alta calidad", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-004", name: "Fibras Naturales Europeas", tax_id: "VAT-FNE-004", supplier_type_id: 1, supplier_status_id: 1, quality_score: 0.97, delivery_score: 0.88, payment_term_id: 5, currency_id: 2, credit_limit: 750000.00, notes: "Proveedor premium de celulosa de eucalipto", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-005", name: "Empaques Industriales SA", tax_id: "RFC-EIS-005", supplier_type_id: 2, supplier_status_id: 1, quality_score: 0.91, delivery_score: 0.94, payment_term_id: 3, currency_id: 3, credit_limit: 100000.00, notes: "Proveedor de cajas corrugadas y tarimas", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-006", name: "Plásticos y Embalajes del Pacífico", tax_id: "RFC-PEP-006", supplier_type_id: 2, supplier_status_id: 1, quality_score: 0.89, delivery_score: 0.91, payment_term_id: 3, currency_id: 1, credit_limit: 80000.00, notes: "Especialista en film stretch y plásticos industriales", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-007", name: "Químicos Industriales Global", tax_id: "RFC-QIG-007", supplier_type_id: 3, supplier_status_id: 1, quality_score: 0.96, delivery_score: 0.93, payment_term_id: 4, currency_id: 1, credit_limit: 400000.00, notes: "Proveedor de blanqueadores y agentes de reforzamiento", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-008", name: "Aditivos y Colorantes Especializados", tax_id: "RFC-ACE-008", supplier_type_id: 3, supplier_status_id: 1, quality_score: 0.94, delivery_score: 0.89, payment_term_id: 3, currency_id: 1, credit_limit: 250000.00, notes: "Colorantes y aditivos para papel tissue y cartón", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-009", name: "Tratamientos Químicos del Centro", tax_id: "RFC-TQC-009", supplier_type_id: 3, supplier_status_id: 2, quality_score: 0.72, delivery_score: 0.68, payment_term_id: 2, currency_id: 3, credit_limit: 50000.00, notes: "Proveedor suspendido por problemas de calidad", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-010", name: "Transportes y Logística Express", tax_id: "RFC-TLE-010", supplier_type_id: 4, supplier_status_id: 1, quality_score: 0.92, delivery_score: 0.96, payment_term_id: 3, currency_id: 3, credit_limit: 200000.00, notes: "Transporte especializado en materiales químicos", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-011", name: "Mantenimiento Industrial Profesional", tax_id: "RFC-MIP-011", supplier_type_id: 4, supplier_status_id: 1, quality_score: 0.87, delivery_score: 0.90, payment_term_id: 2, currency_id: 3, credit_limit: 100000.00, notes: "Mantenimiento preventivo y correctivo de maquinaria", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-012", name: "Consultoría Ambiental Sostenible", tax_id: "RFC-CAS-012", supplier_type_id: 4, supplier_status_id: 1, quality_score: 0.93, delivery_score: 0.88, payment_term_id: 4, currency_id: 1, credit_limit: 150000.00, notes: "Certificaciones ambientales y tratamiento de aguas", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-013", name: "Maquinaria Papelera Internacional", tax_id: "RFC-MPI-013", supplier_type_id: 5, supplier_status_id: 1, quality_score: 0.98, delivery_score: 0.85, payment_term_id: 6, currency_id: 2, credit_limit: 2000000.00, notes: "Equipos de producción y máquinas papeleras Voith", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-014", name: "Repuestos y Refacciones Técnicas", tax_id: "RFC-RRT-014", supplier_type_id: 5, supplier_status_id: 1, quality_score: 0.90, delivery_score: 0.92, payment_term_id: 4, currency_id: 1, credit_limit: 500000.00, notes: "Repuestos originales y genéricos para maquinaria", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-015", name: "Instrumentación y Control Automatizado", tax_id: "RFC-ICA-015", supplier_type_id: 5, supplier_status_id: 1, quality_score: 0.95, delivery_score: 0.87, payment_term_id: 5, currency_id: 1, credit_limit: 800000.00, notes: "Sistemas SCADA y sensores industriales", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-016", name: "Almidones y Adhesivos Naturales", tax_id: "RFC-AAN-016", supplier_type_id: 3, supplier_status_id: 1, quality_score: 0.86, delivery_score: 0.91, payment_term_id: 3, currency_id: 3, credit_limit: 120000.00, notes: "Almidones modificados y adhesivos biodegradables", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-017", name: "Energía y Combustibles Industriales", tax_id: "RFC-ECI-017", supplier_type_id: 4, supplier_status_id: 1, quality_score: 0.89, delivery_score: 0.95, payment_term_id: 2, currency_id: 3, credit_limit: 600000.00, notes: "Gas natural y combustibles para calderas", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-018", name: "Bobinas y Rollos Premium", tax_id: "RFC-BRP-018", supplier_type_id: 2, supplier_status_id: 1, quality_score: 0.92, delivery_score: 0.93, payment_term_id: 3, currency_id: 1, credit_limit: 180000.00, notes: "Bobinas industriales y cores de cartón", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-019", name: "Laboratorio de Análisis de Calidad", tax_id: "RFC-LAC-019", supplier_type_id: 4, supplier_status_id: 1, quality_score: 0.97, delivery_score: 0.89, payment_term_id: 3, currency_id: 3, credit_limit: 80000.00, notes: "Análisis físico-químicos y certificaciones", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil },
	{ code: "SUP-020", name: "Fibras Sintéticas Avanzadas", tax_id: "RFC-FSA-020", supplier_type_id: 1, supplier_status_id: 3, quality_score: 0.65, delivery_score: 0.70, payment_term_id: 1, currency_id: 1, credit_limit: nil, notes: "Proveedor inactivo - pendiente de reactivación", active: true, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15", deleted_at: nil }
]

suppliers = Supplier.create!(suppliers_seed)

# Seeds para supplier_contacts
contacts_seed = [
	{ supplier_id: 1, name: "Carlos Mendoza", email: "cmendoza@celulosa-int.com", phone: "+1-555-0101", mobile: "+1-555-0102", position: "Gerente de Ventas", department: "Ventas", primary: true, active: true, notes: "Contacto principal para órdenes de celulosa kraft", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 1, name: "Ana Martínez", email: "amartinez@celulosa-int.com", phone: "+1-555-0103", mobile: "+1-555-0104", position: "Coordinadora de Logística", department: "Logística", primary: false, active: true, notes: "Coordinación de embarques y fechas de entrega", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 2, name: "Roberto García", email: "rgarcia@pulpafibras.mx", phone: "+52-55-1234-5601", mobile: "+52-55-1234-5602", position: "Director Comercial", department: "Comercial", primary: true, active: true, notes: "Decisor en precios y términos de pago", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 2, name: "María López", email: "mlopez@pulpafibras.mx", phone: "+52-55-1234-5603", mobile: nil, position: "Asistente de Ventas", department: "Ventas", primary: false, active: true, notes: nil, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 3, name: "Luis Fernández", email: "lfernandez@papelverde.mx", phone: "+52-33-9876-5401", mobile: "+52-33-9876-5402", position: "Gerente General", department: "Dirección", primary: true, active: true, notes: "Propietario de la empresa", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 4, name: "Jean-Pierre Dubois", email: "jp.dubois@fibres-europe.eu", phone: "+33-1-4567-8901", mobile: "+33-6-7890-1234", position: "Export Manager", department: "International Sales", primary: true, active: true, notes: "Contacto para cuentas de Latinoamérica", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 4, name: "Sophie Laurent", email: "slaurent@fibres-europe.eu", phone: "+33-1-4567-8902", mobile: nil, position: "Technical Support", department: "Technical", primary: false, active: true, notes: "Especificaciones técnicas y certificaciones", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 5, name: "Pedro Ramírez", email: "pramirez@empaques-ind.mx", phone: "+52-81-5555-0101", mobile: "+52-81-5555-0102", position: "Ejecutivo de Cuenta", department: "Ventas", primary: true, active: true, notes: "Órdenes y cotizaciones", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 7, name: "Dr. Miguel Ángel Torres", email: "mtorres@quimicos-global.com", phone: "+1-713-555-0201", mobile: "+1-713-555-0202", position: "Technical Sales Manager", department: "Technical Sales", primary: true, active: true, notes: "Especialista en blanqueadores", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 7, name: "Patricia Gómez", email: "pgomez@quimicos-global.com", phone: "+1-713-555-0203", mobile: "+1-713-555-0204", position: "Customer Service Representative", department: "Customer Service", primary: false, active: true, notes: "Seguimiento de pedidos y facturación", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 8, name: "Ing. Jorge Morales", email: "jmorales@aditivos-color.com", phone: "+1-305-555-0301", mobile: "+1-305-555-0302", position: "Applications Engineer", department: "Technical", primary: true, active: true, notes: "Desarrollo de colorantes personalizados", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 10, name: "Daniel Ortiz", email: "dortiz@translogex.mx", phone: "+52-55-8888-0101", mobile: "+52-55-8888-0102", position: "Coordinador de Operaciones", department: "Operaciones", primary: true, active: true, notes: "Disponible 24/7 para emergencias", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 13, name: "Klaus Müller", email: "kmuller@machinery-intl.de", phone: "+49-89-1234-5678", mobile: "+49-172-9876543", position: "Senior Sales Engineer", department: "Sales", primary: true, active: true, notes: "Equipos Voith y proyectos de gran escala", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 13, name: "Stefan Weber", email: "sweber@machinery-intl.de", phone: "+49-89-1234-5679", mobile: nil, position: "After Sales Manager", department: "Service", primary: false, active: true, notes: "Soporte técnico y mantenimiento", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 14, name: "Fernando Castro", email: "fcastro@repuestos-tech.com", phone: "+1-713-777-0401", mobile: "+1-713-777-0402", position: "Parts Specialist", department: "Sales", primary: true, active: true, notes: "Especialista en repuestos originales", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 17, name: "Alejandro Núñez", email: "anunez@energia-comb.mx", phone: "+52-55-3333-0501", mobile: "+52-55-3333-0502", position: "Gerente de Cuentas Industriales", department: "Ventas", primary: true, active: true, notes: "Contratos de suministro de gas natural", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 19, name: "Dra. Laura Sánchez", email: "lsanchez@lab-calidad.mx", phone: "+52-33-2222-0601", mobile: "+52-33-2222-0602", position: "Directora de Laboratorio", department: "Técnico", primary: true, active: true, notes: "Certificaciones ISO y análisis especializados", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 19, name: "Gabriela Ruiz", email: "gruiz@lab-calidad.mx", phone: "+52-33-2222-0603", mobile: nil, position: "Coordinadora Administrativa", department: "Administración", primary: false, active: true, notes: "Cotizaciones y facturación", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" }
]

contacts = SupplierContact.create!(contacts_seed)

# Actualizar suppliers con primary_contact_id

# Seeds para supplier_contacts
SupplierContact.create!([
	{ supplier_id: 1, name: "Carlos Mendoza", email: "cmendoza@celulosa-int.com", phone: "+1-555-0101", mobile: "+1-555-0102", position: "Gerente de Ventas", department: "Ventas", primary: true, active: true, notes: "Contacto principal para órdenes de celulosa kraft", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 1, name: "Ana Martínez", email: "amartinez@celulosa-int.com", phone: "+1-555-0103", mobile: "+1-555-0104", position: "Coordinadora de Logística", department: "Logística", primary: false, active: true, notes: "Coordinación de embarques y fechas de entrega", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 2, name: "Roberto García", email: "rgarcia@pulpafibras.mx", phone: "+52-55-1234-5601", mobile: "+52-55-1234-5602", position: "Director Comercial", department: "Comercial", primary: true, active: true, notes: "Decisor en precios y términos de pago", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 2, name: "María López", email: "mlopez@pulpafibras.mx", phone: "+52-55-1234-5603", mobile: nil, position: "Asistente de Ventas", department: "Ventas", primary: false, active: true, notes: nil, created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 3, name: "Luis Fernández", email: "lfernandez@papelverde.mx", phone: "+52-33-9876-5401", mobile: "+52-33-9876-5402", position: "Gerente General", department: "Dirección", primary: true, active: true, notes: "Propietario de la empresa", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 4, name: "Jean-Pierre Dubois", email: "jp.dubois@fibres-europe.eu", phone: "+33-1-4567-8901", mobile: "+33-6-7890-1234", position: "Export Manager", department: "International Sales", primary: true, active: true, notes: "Contacto para cuentas de Latinoamérica", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 4, name: "Sophie Laurent", email: "slaurent@fibres-europe.eu", phone: "+33-1-4567-8902", mobile: nil, position: "Technical Support", department: "Technical", primary: false, active: true, notes: "Especificaciones técnicas y certificaciones", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 5, name: "Pedro Ramírez", email: "pramirez@empaques-ind.mx", phone: "+52-81-5555-0101", mobile: "+52-81-5555-0102", position: "Ejecutivo de Cuenta", department: "Ventas", primary: true, active: true, notes: "Órdenes y cotizaciones", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 7, name: "Dr. Miguel Ángel Torres", email: "mtorres@quimicos-global.com", phone: "+1-713-555-0201", mobile: "+1-713-555-0202", position: "Technical Sales Manager", department: "Technical Sales", primary: true, active: true, notes: "Especialista en blanqueadores", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 7, name: "Patricia Gómez", email: "pgomez@quimicos-global.com", phone: "+1-713-555-0203", mobile: "+1-713-555-0204", position: "Customer Service Representative", department: "Customer Service", primary: false, active: true, notes: "Seguimiento de pedidos y facturación", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 8, name: "Ing. Jorge Morales", email: "jmorales@aditivos-color.com", phone: "+1-305-555-0301", mobile: "+1-305-555-0302", position: "Applications Engineer", department: "Technical", primary: true, active: true, notes: "Desarrollo de colorantes personalizados", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 10, name: "Daniel Ortiz", email: "dortiz@translogex.mx", phone: "+52-55-8888-0101", mobile: "+52-55-8888-0102", position: "Coordinador de Operaciones", department: "Operaciones", primary: true, active: true, notes: "Disponible 24/7 para emergencias", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 13, name: "Klaus Müller", email: "kmuller@machinery-intl.de", phone: "+49-89-1234-5678", mobile: "+49-172-9876543", position: "Senior Sales Engineer", department: "Sales", primary: true, active: true, notes: "Equipos Voith y proyectos de gran escala", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 13, name: "Stefan Weber", email: "sweber@machinery-intl.de", phone: "+49-89-1234-5679", mobile: nil, position: "After Sales Manager", department: "Service", primary: false, active: true, notes: "Soporte técnico y mantenimiento", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 14, name: "Fernando Castro", email: "fcastro@repuestos-tech.com", phone: "+1-713-777-0401", mobile: "+1-713-777-0402", position: "Parts Specialist", department: "Sales", primary: true, active: true, notes: "Especialista en repuestos originales", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 17, name: "Alejandro Núñez", email: "anunez@energia-comb.mx", phone: "+52-55-3333-0501", mobile: "+52-55-3333-0502", position: "Gerente de Cuentas Industriales", department: "Ventas", primary: true, active: true, notes: "Contratos de suministro de gas natural", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 19, name: "Dra. Laura Sánchez", email: "lsanchez@lab-calidad.mx", phone: "+52-33-2222-0601", mobile: "+52-33-2222-0602", position: "Directora de Laboratorio", department: "Técnico", primary: true, active: true, notes: "Certificaciones ISO y análisis especializados", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" },
	{ supplier_id: 19, name: "Gabriela Ruiz", email: "gruiz@lab-calidad.mx", phone: "+52-33-2222-0603", mobile: nil, position: "Coordinadora Administrativa", department: "Administración", primary: false, active: true, notes: "Cotizaciones y facturación", created_at: "2026-01-22 16:45:15", updated_at: "2026-01-22 16:45:15" }
])
