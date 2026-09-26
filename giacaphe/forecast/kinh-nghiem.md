# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 26/09/2026 07:52. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 13 mốc dự đoán, 12 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 12 | 238 đ | 417 đ | 92% |
| 2 | 11 | 445 đ | 618 đ | 100% |
| 3 | 10 | 627 đ | 850 đ | 100% |
| 4 | 9 | 711 đ | 1.056 đ | 100% |
| 5 | 8 | 624 đ | 1.288 đ | 100% |
| 6 | 7 | 748 đ | 1.471 đ | 100% |
| 7 | 6 | 895 đ | 1.717 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 12 lần đo: sai số TB **238 đ**, đứng yên **417 đ**, đúng chiều 67%, dải 90% phủ 92%.
→ Mô hình **đang thắng** mốc đứng yên (−179 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 9 | 78% | 420 đ | giúp (+182 đ) |
| tín hiệu sàn | 0 | — | 238 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 238 đ | chưa có tiếng nói |
| AI điều tiết | 9 | 44% | 192 đ | hại (−46 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 10 | 50% | 218 đ | hại (−20 đ) |
| đề xuất lệch sàn | 4 | 0% | 238 đ | không đổi |
| cung–cầu thế giới (GLM) | 7 | 57% | 214 đ | hại (−24 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| kỹ thuật và tin cùng chiều | 6 | 235 đ | 198 đ |
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 5 lần
- đứng yên, đoán đứng yên: 3 lần
- bỏ lỡ cú đi: 2 lần
- đúng chiều, quá tay: 1 lần
- đoán cú đi không xảy ra: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 6 ngày sàn đi ≥ +0,50%): **0,25**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (8/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 350 đ |
| 0,4 | 295 đ |
| 0,5 | 298 đ |
| 0,6 | 382 đ |
| 0,7 | 495 đ |
| 0,8 | 636 đ |

### Năm lỗi lớn nhất và lý do

- **26/09/2026** (mốc 25/09/2026), sai 1.112 đ:
  - Đoán cú đi không xảy ra: giá đi 0 đ, dự đoán +1.112 đ.
  - Lớp truyền dẫn London kéo sai chiều (+1.084 đ), làm sai số tăng 1.084 đ.
- **17/09/2026** (mốc 16/09/2026), sai 512 đ:
  - Đúng chiều, quá tay: giá đi −300 đ, dự đoán −812 đ.
  - Sàn London đi thêm −1,52% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,11 lần cú đi −3,00% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **25/09/2026** (mốc 24/09/2026), sai 300 đ:
  - Bỏ lỡ cú đi: giá đi −300 đ, dự đoán 0 đ.
  - Sàn London đi thêm −0,91% sau lượt dự đoán — phần này lượt dự đoán chưa thể biết.
  - Giá trong nước chép 0,40 lần cú đi −0,81% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **24/09/2026** (mốc 23/09/2026), sai 274 đ:
  - Đúng chiều, vừa: giá đi +1.000 đ, dự đoán +726 đ.
  - Lớp truyền dẫn London đúng chiều (+811 đ), bớt được 811 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−85 đ), làm sai số tăng 85 đ.
- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 12 | 248 đ | 425 đ | 67% | 92% |
| Lâm Đồng | 12 | 229 đ | 425 đ | 67% | 92% |
| Gia Lai | 12 | 248 đ | 425 đ | 67% | 92% |
| Đắk Nông | 12 | 237 đ | 417 đ | 67% | 92% |
| Robusta London | 9 | 46 USD | 47 USD | 56% | 89% |
| Arabica New York | 9 | 115 USD | 134 USD | 78% | 89% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
