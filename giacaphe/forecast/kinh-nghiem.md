# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 12/11/2026 09:00. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 53 mốc dự đoán, 52 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 44 | 325 đ | 600 đ | 98% |
| 2 | 42 | 716 đ | 736 đ | 93% |
| 3 | 41 | 876 đ | 1.000 đ | 93% |
| 4 | 41 | 1.167 đ | 1.151 đ | 85% |
| 5 | 40 | 1.125 đ | 1.235 đ | 90% |
| 6 | 40 | 1.228 đ | 1.455 đ | 92% |
| 7 | 43 | 1.480 đ | 1.640 đ | 86% |

### Ngày-1: mô hình so với đứng yên

Trên 52 lần đo: sai số TB **333 đ**, đứng yên **556 đ**, đúng chiều 73%, dải 90% phủ 98%.
→ Mô hình **đang thắng** mốc đứng yên (−223 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 42 | 86% | 550 đ | giúp (+217 đ) |
| tín hiệu sàn | 0 | — | 333 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 333 đ | chưa có tiếng nói |
| AI điều tiết | 27 | 48% | 327 đ | hại (−6 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 21 | 62% | 328 đ | hại (−5 đ) |
| đề xuất lệch sàn | 5 | 0% | 332 đ | hại (−1 đ) |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Chưa có mốc nào có nhãn của hôm đó và giá thật để so.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 0) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 18 lần
- đứng yên, đoán đứng yên: 7 lần
- bỏ lỡ cú đi: 6 lần
- đúng chiều, quá tay: 6 lần
- đoán cú đi không xảy ra: 6 lần
- đúng chiều, non tay: 6 lần
- ngược chiều: 2 lần
- bỏ lỡ cú đi lớn: 1 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 32 ngày sàn đi ≥ +0,50%): **0,41**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 358 so với 358) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 407 đ |
| 0,4 | 370 đ |
| 0,5 | 358 đ |
| 0,6 | 411 đ |
| 0,7 | 487 đ |
| 0,8 | 574 đ |

### Năm lỗi lớn nhất và lý do

- **03/11/2026** (mốc 02/11/2026), sai 1.654 đ:
  - Ngược chiều: giá đi −1.200 đ, dự đoán +454 đ.
  - Lớp truyền dẫn London kéo sai chiều (+492 đ), làm sai số tăng 492 đ.
  - Giá trong nước chép -1,22 lần cú đi +1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **21/10/2026** (mốc 20/10/2026), sai 1.003 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −997 đ.
  - Lớp truyền dẫn London đúng chiều (−997 đ), bớt được 997 đ sai số.
  - Giá trong nước chép 1,00 lần cú đi −2,12% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **31/10/2026** (mốc 30/10/2026), sai 999 đ:
  - Ngược chiều: giá đi −500 đ, dự đoán +499 đ.
  - Lớp truyền dẫn London kéo sai chiều (+578 đ), làm sai số tăng 578 đ.
  - Giá trong nước chép -0,43 lần cú đi +1,32% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **02/10/2026** (mốc 01/10/2026), sai 841 đ:
  - Bỏ lỡ cú đi lớn: giá đi −800 đ, dự đoán +41 đ.
- **02/11/2026** (mốc 31/10/2026), sai 814 đ:
  - Đúng chiều, non tay: giá đi −1.200 đ, dự đoán −386 đ.
  - Lớp AI điều tiết đúng chiều (−119 đ), bớt được 119 đ sai số.
  - Mốc và ngày chấm cách nhau 2 ngày (nguồn nghỉ).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 52 | 325 đ | 548 đ | 73% | 98% |
| Lâm Đồng | 52 | 317 đ | 556 đ | 73% | 98% |
| Gia Lai | 52 | 336 đ | 554 đ | 69% | 98% |
| Đắk Nông | 52 | 347 đ | 571 đ | 71% | 98% |
| Robusta London | 47 | 38 USD | 38 USD | 47% | 96% |
| Arabica New York | 47 | 99 USD | 99 USD | 57% | 94% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
