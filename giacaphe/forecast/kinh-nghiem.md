# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 17/09/2026 07:53. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 4 mốc dự đoán, 3 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 3 | 352 đ | 333 đ | 100% |
| 2 | 2 | 290 đ | 700 đ | 100% |
| 3 | 1 | 462 đ | 600 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 3 lần đo: sai số TB **352 đ**, đứng yên **333 đ**, đúng chiều 67%, dải 90% phủ 100%.
→ Mô hình **đang thua** mốc đứng yên (+19 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 3 | 67% | 409 đ | giúp (+57 đ) |
| tín hiệu sàn | 0 | — | 352 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 352 đ | chưa có tiếng nói |
| AI điều tiết | 2 | 0% | 276 đ | hại (−76 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 2 | 0% | 326 đ | hại (−26 đ) |
| đề xuất lệch sàn | 0 | — | 352 đ | chưa có tiếng nói |
| cung–cầu thế giới (GLM) | 2 | 0% | 301 đ | hại (−51 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 1 | 812 đ | 737 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- bỏ lỡ cú đi: 1 lần
- đúng chiều, vừa: 1 lần
- đoán cú đi không xảy ra: 1 lần

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (3/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 364 đ |
| 0,4 | 361 đ |
| 0,5 | 352 đ |
| 0,6 | 395 đ |
| 0,7 | 481 đ |
| 0,8 | 568 đ |

### Năm lỗi lớn nhất và lý do

- **17/09/2026** (mốc 16/09/2026), sai 812 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán −812 đ.
  - Lớp truyền dẫn London kéo sai chiều (−699 đ), làm sai số tăng 699 đ.
  - Lớp AI điều tiết kéo sai chiều (−113 đ), làm sai số tăng 113 đ.
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.
- **16/09/2026** (mốc 15/09/2026), sai 65 đ:
  - Đúng chiều, vừa: giá đi −800 đ, dự đoán −735 đ.
  - Lớp truyền dẫn London đúng chiều (−735 đ), bớt được 735 đ sai số.
  - Sàn London đi thêm +1,54% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 3 | 386 đ | 367 đ | 67% | 100% |
| Lâm Đồng | 3 | 385 đ | 367 đ | 67% | 100% |
| Gia Lai | 3 | 386 đ | 367 đ | 67% | 100% |
| Đắk Nông | 3 | 349 đ | 333 đ | 67% | 100% |
| Robusta London | 2 | 4 USD | 5 USD | 50% | 100% |
| Arabica New York | 2 | 123 USD | 154 USD | 100% | 100% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
