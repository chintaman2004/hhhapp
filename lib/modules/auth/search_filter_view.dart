import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_app_name/modules/home/home_controller.dart';
import 'package:your_app_name/shared/widgets/buttons/primary_button.dart';

class SearchFilterView extends GetView<HomeController> {
  final _formKey = GlobalKey<FormState>();

  // Range values for sliders
  final RxDouble _priceRangeLower = 0.0.obs;
  final RxDouble _priceRangeUpper = 1000000.0.obs;
  final RxInt _bedrooms = 0.obs;
  final RxInt _bathrooms = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Properties'),
        actions: [
          TextButton(
            onPressed: () {
              // Reset all filters
              _priceRangeLower.value = 0.0;
              _priceRangeUpper.value = 1000000.0;
              _bedrooms.value = 0;
              _bathrooms.value = 0;
            },
            child: Text('Reset', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Property Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Obx(() => Wrap(
                    spacing: 10,
                    children: [
                      _buildFilterChip('House', 0),
                      _buildFilterChip('Apartment', 1),
                      _buildFilterChip('Flat', 2),
                      _buildFilterChip('Condo', 3),
                    ],
                  )),
              SizedBox(height: 20),
              Text('Price Range',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Obx(() => RangeSlider(
                    values: RangeValues(
                        _priceRangeLower.value, _priceRangeUpper.value),
                    min: 0,
                    max: 10000000,
                    divisions: 10,
                    labels: RangeLabels(
                      '\$${_priceRangeLower.value.round()}',
                      '\$${_priceRangeUpper.value.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      _priceRangeLower.value = values.start;
                      _priceRangeUpper.value = values.end;
                    },
                  )),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${_priceRangeLower.value.round()}'),
                      Text('\$${_priceRangeUpper.value.round()}'),
                    ],
                  )),
              SizedBox(height: 20),
              Text('Bedrooms',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Obx(() => Slider(
                    value: _bedrooms.value.toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: _bedrooms.value == 0
                        ? 'Any'
                        : _bedrooms.value.toString(),
                    onChanged: (double value) {
                      _bedrooms.value = value.toInt();
                    },
                  )),
              SizedBox(height: 20),
              Text('Bathrooms',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Obx(() => Slider(
                    value: _bathrooms.value.toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: _bathrooms.value == 0
                        ? 'Any'
                        : _bathrooms.value.toString(),
                    onChanged: (double value) {
                      _bathrooms.value = value.toInt();
                    },
                  )),
              SizedBox(height: 30),
              PrimaryButton(
                text: 'Apply Filters',
                onPressed: () {
                  // Apply filters to the controller
                  controller.applyFilters(
                    propertyType: controller.currentTab.value,
                    minPrice: _priceRangeLower.value,
                    maxPrice: _priceRangeUpper.value,
                    bedrooms: _bedrooms.value,
                    bathrooms: _bathrooms.value,
                  );
                  Get.back();
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    return Obx(() => FilterChip(
          label: Text(label),
          selected: controller.currentTab.value == index,
          onSelected: (bool selected) {
            controller.changeTab(selected ? index : 0);
          },
        ));
  }
}
