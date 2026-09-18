# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 18/09/2026 23:36. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 5 mốc dự đoán, 4 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 4 | 202 đ | 475 đ | 100% |
| 2 | 3 | 308 đ | 867 đ | 100% |
| 3 | 2 | 850 đ | 1.300 đ | 100% |
| 4 | 1 | 1.311 đ | 1.500 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 4 lần đo: sai số TB **202 đ**, đứng yên **475 đ**, đúng chiều 100%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−273 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 4 | 100% | 447 đ | giúp (+245 đ) |
| tín hiệu sàn | 0 | — | 202 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 202 đ | chưa có tiếng nói |
| AI điều tiết | 3 | 67% | 146 đ | hại (−56 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 3 | 67% | 175 đ | hại (−27 đ) |
| đề xuất lệch sàn | 1 | 0% | 202 đ | không đổi |
| cung–cầu thế giới (GLM) | 3 | 67% | 156 đ | hại (−46 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 2 | 282 đ | 229 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 2 lần
- bỏ lỡ cú đi: 1 lần
- đúng chiều, quá tay: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 2 ngày sàn đi ≥ +0,50%): **0,33**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (4/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 239 đ |
| 0,4 | 210 đ |
| 0,5 | 202 đ |
| 0,6 | 261 đ |
| 0,7 | 353 đ |
| 0,8 | 445 đ |

### Năm lỗi lớn nhất và lý do

- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.
- **16/09/2026** (mốc 15/09/2026), sai 65 đ:
  - Đúng chiều, vừa: giá đi −800 đ, dự đoán −735 đ.
  - Lớp truyền dẫn London đúng chiều (−735 đ), bớt được 735 đ sai số.
  - Sàn London đi thêm +1,54% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
- **18/09/2026** (mốc 17/09/2026), sai 53 đ:
  - Đúng chiều, vừa: giá đi −600 đ, dự đoán −653 đ.
  - Lớp truyền dẫn London đúng chiều (−541 đ), bớt được 435 đ sai số.
  - Giá trong nước chép 0,56 lần cú đi −1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 4 | 228 đ | 500 đ | 100% | 100% |
| Lâm Đồng | 4 | 200 đ | 525 đ | 100% | 100% |
| Gia Lai | 4 | 228 đ | 500 đ | 100% | 100% |
| Đắk Nông | 4 | 200 đ | 475 đ | 100% | 100% |
| Robusta London | 4 | 38 USD | 38 USD | 50% | 100% |
| Arabica New York | 4 | 168 USD | 205 USD | 100% | 75% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
