# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 08/10/2026 19:30. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 25 mốc dự đoán, 24 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 24 | 220 đ | 421 đ | 100% |
| 2 | 23 | 500 đ | 513 đ | 96% |
| 3 | 22 | 604 đ | 691 đ | 96% |
| 4 | 21 | 726 đ | 843 đ | 95% |
| 5 | 20 | 817 đ | 900 đ | 95% |
| 6 | 19 | 878 đ | 921 đ | 95% |
| 7 | 18 | 999 đ | 1.028 đ | 94% |

### Ngày-1: mô hình so với đứng yên

Trên 24 lần đo: sai số TB **220 đ**, đứng yên **421 đ**, đúng chiều 71%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−201 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 17 | 82% | 424 đ | giúp (+204 đ) |
| tín hiệu sàn | 0 | — | 220 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 220 đ | chưa có tiếng nói |
| AI điều tiết | 12 | 42% | 197 đ | hại (−23 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 13 | 54% | 208 đ | hại (−12 đ) |
| đề xuất lệch sàn | 5 | 0% | 219 đ | hại (−1 đ) |
| cung–cầu thế giới (GLM) | 12 | 42% | 211 đ | hại (−9 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 7 | 258 đ | 231 đ |
| kỹ thuật và tin ngược chiều | 4 | 344 đ | 358 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 4) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 7 lần
- đứng yên, đoán đứng yên: 7 lần
- bỏ lỡ cú đi: 3 lần
- đúng chiều, quá tay: 3 lần
- đoán cú đi không xảy ra: 2 lần
- đúng chiều, non tay: 1 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 12 ngày sàn đi ≥ +0,50%): **0,29**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (14/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 337 đ |
| 0,4 | 284 đ |
| 0,5 | 267 đ |
| 0,6 | 361 đ |
| 0,7 | 475 đ |
| 0,8 | 604 đ |

### Năm lỗi lớn nhất và lý do

- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **06/10/2026** (mốc 05/10/2026), sai 799 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +799 đ.
  - Lớp truyền dẫn London kéo sai chiều (+799 đ), làm sai số tăng 799 đ.
- **07/10/2026** (mốc 06/10/2026), sai 526 đ:
  - Đúng chiều, quá tay: giá đi +300 đ, dự đoán +826 đ.
  - Giá trong nước chép 0,18 lần cú đi +1,76% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **01/10/2026** (mốc 30/09/2026), sai 519 đ:
  - Đúng chiều, non tay: giá đi +1.000 đ, dự đoán +481 đ.
  - Lớp truyền dẫn London đúng chiều (+481 đ), bớt được 481 đ sai số.
  - Giá trong nước chép 0,96 lần cú đi +1,11% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 24 | 225 đ | 425 đ | 71% | 100% |
| Lâm Đồng | 24 | 221 đ | 429 đ | 71% | 100% |
| Gia Lai | 24 | 225 đ | 425 đ | 71% | 100% |
| Đắk Nông | 24 | 219 đ | 421 đ | 67% | 100% |
| Robusta London | 19 | 43 USD | 44 USD | 47% | 90% |
| Arabica New York | 19 | 107 USD | 114 USD | 63% | 90% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
