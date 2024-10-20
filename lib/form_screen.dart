import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLicenseAgreed = false; // Variable to store the checkbox value

  // bool _obscured = true;
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _timeController1 = TextEditingController();
  final _timeController2 = TextEditingController();
  TimeOfDay? _selectedTime;
  String? _value;
  final List<String> _dropdownItems = [
    'Cash',
    'Visa Card',
    'Master Card',
    'American Express',
    'BCA card',
    'JCB Card',
    "Traveller's Cheque",
    'Voucher',
    'Company Acct.',
    'Others'
  ];

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _timeController1.dispose();
    _timeController2.dispose();
    super.dispose();
  }

// Function untuk memilih waktu
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        // Format waktu (HH:mm) dan setel ke TextField
        final formattedTime = pickedTime.format(context);
        _timeController1.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 202, 193, 140),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // const SizedBox(height: 16),
            // TextFormField(
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //     border: const OutlineInputBorder(),
            //     suffix: IconButton(
            //       icon: Icon(
            //         _obscured ? Icons.visibility : Icons.visibility_off,
            //       ),
            //       onPressed: () {
            //         setState(() {
            //           _obscured = !_obscured;
            //         });
            //       },
            //     ),
            //   ),
            //   obscureText: _obscured,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Please enter your password';
            //     }
            //     return null;
            //   },
            // ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller1,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Arrival Date',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  _controller1.text = DateFormat('dd MMMM yyyy').format(date);
                }
              },
            ),
            const SizedBox(height: 16),
            // TextFormField untuk input waktu kedatangan
            TextFormField(
              controller: _timeController1, // Controller untuk waktu
              decoration: const InputDecoration(
                labelText: 'Flight ETA', // Label yang ditampilkan
                border: OutlineInputBorder(), // Border untuk TextFormField
              ),
              readOnly:
                  true, // Membuat field hanya dapat diubah melalui TimePicker
              onTap: () async {
                // Fungsi untuk menampilkan TimePicker saat TextField ditekan
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  // Format waktu ke dalam format yang diinginkan (HH:mm)
                  final formattedTime = pickedTime.format(context);
                  // Setel hasil yang dipilih ke controller untuk ditampilkan
                  _timeController1.text = formattedTime;
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller2,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Departure Date',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  _controller2.text = DateFormat('dd MMMM yyyy').format(date);
                }
              },
            ),
            const SizedBox(height: 16),
            // TextFormField untuk input waktu keberangkatan
            TextFormField(
              controller: _timeController2, // Controller untuk waktu
              decoration: const InputDecoration(
                labelText: 'Flight ETD', // Label yang ditampilkan
                border: OutlineInputBorder(), // Border untuk TextFormField
              ),
              readOnly:
                  true, // Membuat field hanya dapat diubah melalui TimePicker
              onTap: () async {
                // Fungsi untuk menampilkan TimePicker saat TextField ditekan
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  // Format waktu ke dalam format yang diinginkan (HH:mm)
                  final formattedTime = pickedTime.format(context);
                  // Setel hasil yang dipilih ke controller untuk ditampilkan
                  _timeController2.text = formattedTime;
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'No. of Guests', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of guests'; // Validasi jika field kosong
                }
                final int? numberOfGuests = int.tryParse(value);
                if (numberOfGuests == null || numberOfGuests <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),

            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Room type', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter room type';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Room Rate', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Menggunakan keyboard untuk angka desimal
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^\d*\.?\d{0,2}')), // Hanya mengizinkan angka dan satu titik desimal
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter room rate'; // Validasi jika field kosong
                }
                final double? roomRate = double.tryParse(value);
                if (roomRate == null || roomRate <= 0) {
                  return 'Please enter a valid room rate'; // Validasi jika input bukan angka atau kurang dari 0
                }
                return null;
              },
              onChanged: (value) {
                // Format input menjadi mata uang saat pengguna mengetik
                final formattedValue = NumberFormat.simpleCurrency()
                    .format(double.tryParse(value.replaceAll(',', '')) ?? 0);
                // Perbarui nilai di field tanpa mengubah posisi kursor
                final textEditingController =
                    TextEditingController(text: formattedValue);
                textEditingController.selection = TextSelection.fromPosition(
                    TextPosition(offset: formattedValue.length));
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Room No.', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your room number'; // Validasi jika field kosong
                }
                final int? roomNumber = int.tryParse(value);
                if (roomNumber == null || roomNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Confirmation No.', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the confirmation number'; // Validasi jika field kosong
                }
                final int? confirmationNumber = int.tryParse(value);
                if (confirmationNumber == null || confirmationNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'First Name', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Folio No.', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your folio number'; // Validasi jika field kosong
                }
                final int? folioNumber = int.tryParse(value);
                if (folioNumber == null || folioNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Address', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'City', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your city';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'State/Province', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your state';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Country', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your country';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Postal Code', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your postal code';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Passport No.', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your passport number'; // Validasi jika field kosong
                }
                final int? passNumber = int.tryParse(value);
                if (passNumber == null || passNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Nationality', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your nationality';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'No. Membership Card', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your membership card number'; // Validasi jika field kosong
                }
                final int? cardNumber = int.tryParse(value);
                if (cardNumber == null || cardNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller3,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (date != null) {
                  _controller3.text = DateFormat('dd MMMM yyyy').format(date);
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Company', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your company';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Occupation/Position',
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your occupation/position';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'No. Telephone', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your telephone number'; // Validasi jika field kosong
                }
                final int? telpNumber = int.tryParse(value);
                if (telpNumber == null || telpNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'No. Handphone', // Label untuk field input
                border: OutlineInputBorder(), // Border untuk field
              ),
              keyboardType:
                  TextInputType.number, // Menggunakan keyboard numerik
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Hanya mengizinkan input angka
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mobile number'; // Validasi jika field kosong
                }
                final int? mobileNumber = int.tryParse(value);
                if (mobileNumber == null || mobileNumber <= 0) {
                  return 'Please enter a valid number'; // Validasi jika input bukan angka atau kurang dari 1
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: _value, // Nilai awal yang dipilih
              decoration: InputDecoration(
                labelText: 'Payment Method',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              onChanged: (value) {
                setState(() {
                  _value = value; // Menyimpan nilai yang dipilih
                });
              },
              items: _dropdownItems.map((String item) {
                return DropdownMenuItem(
                  value: item, // Nilai yang disimpan untuk item ini
                  child: Text(item), // Tampilan teks dari item ini
                );
              }).toList(),
            ),
            // License agreement checkbox
            CheckboxListTile(
              title: const Text('I agree Rp 1.000.000 for smoking penalty.'),
              value: _isLicenseAgreed,
              onChanged: (value) {
                setState(() {
                  _isLicenseAgreed = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
            ),
            const Text(
                'Regardless of charge instruction, I hereby acknowledge to be personally responsible for the payment of account.'),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_isLicenseAgreed) {
                    // Proceed with form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form submitted')),
                    );
                  } else {
                    // Show warning if the license checkbox is not checked
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('You must agree to the terms to proceed')),
                    );
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
