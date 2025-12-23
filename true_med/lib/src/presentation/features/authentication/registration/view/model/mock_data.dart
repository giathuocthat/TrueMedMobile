class BusinessType {
  final int id;
  final String code;
  final String name;

  const BusinessType({
    required this.id,
    required this.code,
    required this.name,
  });
}

final List<BusinessType> businessTypes = [
  BusinessType(id: 1, code: 'pharmacy_counter', name: 'Quầy thuốc'),
  BusinessType(id: 2, code: 'pharmacy', name: 'Nhà thuốc'),
  BusinessType(id: 3, code: 'clinic', name: 'Phòng khám'),
  BusinessType(id: 4, code: 'pharma_company', name: 'Công ty dược phẩm'),
  BusinessType(id: 5, code: 'hospital', name: 'Bệnh viện'),
  BusinessType(id: 6, code: 'dental', name: 'Nha khoa'),
  BusinessType(id: 7, code: 'aesthetic', name: 'Thẩm mỹ viện'),
  BusinessType(id: 8, code: 'medical_center', name: 'Trung tâm y tế'),
  BusinessType(id: 9, code: 'pharmacist', name: 'Dược sĩ'),
];
