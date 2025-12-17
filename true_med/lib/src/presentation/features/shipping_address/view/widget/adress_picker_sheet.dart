import 'package:flutter/material.dart';
import '../../../../../domain/entities/address_entity.dart';
import '../../../../../domain/entities/address_shipping_entity.dart';
import '../../../../../domain/entities/province_entity.dart';

class AdressPickerSheet<T extends AddressItem> extends StatefulWidget {
  final List<T> items;
  final String hint;
  final int idSelected;

  const AdressPickerSheet({
    super.key,
    required this.items,
    required this.hint,
    required this.idSelected,
  });

  @override
  State<AdressPickerSheet<T>> createState() => _AdressPickerSheetState<T>();
}

class _AdressPickerSheetState<T extends AddressItem>
    extends State<AdressPickerSheet<T>> {
  late TextEditingController _searchCtrl;
  late List<T> _filtered;

  //late List<T> _filtered;

  @override
  void initState() {
    super.initState();
    _searchCtrl = TextEditingController();
    _filtered = widget.items.map((e) => e).toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.85;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child:
                          /// SEARCH
                          TextField(
                            controller: _searchCtrl,
                            onChanged: _onSearch,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black, // ⭐ QUAN TRỌNG
                              fontSize: 14,
                            ),
                            //value: _searchCtrl.text,
                            decoration: InputDecoration(
                              hintText: widget.hint,
                              prefixIcon: const Icon(Icons.search),
                              isDense: true,
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: _filtered.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = _filtered[index];
                final isSelected = item.id == widget.idSelected;
                //final isSelected = false;
                return ListTile(
                  title: Text(item.name, style: const TextStyle(fontSize: 15)),
                  trailing: isSelected
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    Navigator.pop(context, item); // trả value về
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSearch(String keyword) {
    final normalizedKeyword = removeVietnameseDiacritics(keyword).toLowerCase();
    setState(() {
      //_searchCtrl.text = keyword;
      _filtered = widget.items
          //.where((e) => e.name.toLowerCase().contains(keyword.toLowerCase()))
          .where((e) => e.normalizedName.contains(normalizedKeyword))
          .toList();
    });
  }
}
