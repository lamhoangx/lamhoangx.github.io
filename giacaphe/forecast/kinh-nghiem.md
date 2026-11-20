# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 20/11/2026 14:45. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 54 mốc dự đoán, 53 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 45 | 429 đ | 749 đ | 91% |
| 2 | 43 | 944 đ | 1.026 đ | 86% |
| 3 | 42 | 1.169 đ | 1.345 đ | 86% |
| 4 | 41 | 1.520 đ | 1.532 đ | 78% |
| 5 | 40 | 1.547 đ | 1.620 đ | 82% |
| 6 | 41 | 1.859 đ | 2.037 đ | 83% |
| 7 | 45 | 2.031 đ | 2.171 đ | 78% |

### Lớp xu hướng chậm (ngày 2–7)

Từ `tv-close-gemini-v12` các ngày 2–7 cộng thêm 0,5 × mức đổi trung bình mỗi ngày trên 20 phiên của chính chuỗi giá (từ `tv-close-gemini-v13`: 0,25 khi chuỗi vừa qua phiên sốc). Trên 3 mốc lớp có lên tiếng (6 lần chấm ngày 2–7): sai số TB **4.207 đ**, nếu bỏ lớp **4.548 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 3) rồi mới kết luận.

### Ngày-1: mô hình so với đứng yên

Trên 53 lần đo: sai số TB **436 đ**, đứng yên **702 đ**, đúng chiều 74%, dải 90% phủ 92%.
→ Mô hình **đang thắng** mốc đứng yên (−266 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 46 | 83% | 690 đ | giúp (+254 đ) |
| dự đoán sàn London | 0 | — | 436 đ | chưa có tiếng nói |
| giá sàn đã chạy | 0 | — | 436 đ | chưa có tiếng nói |
| tín hiệu sàn | 0 | — | 436 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 436 đ | chưa có tiếng nói |
| AI điều tiết | 23 | 48% | 437 đ | giúp (+1 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 17 | 65% | 433 đ | hại (−3 đ) |
| đề xuất lệch sàn | 3 | 0% | 436 đ | không đổi |

### Lớp đang đo BÓNG (chưa áp vào dự đoán)

**kỳ vọng của giới phân tích** — chỉ ĐO, dự đoán không dùng nhãn này; sổ tính "nếu áp thêm lớp này" bằng đúng hàm của bước ngày-1.
Trên 2 lần có nhãn (2 lần khác "đi ngang"): đúng chiều 50%; sai số TB thật **244 đ**, nếu áp thêm lớp này **244 đ**.
Luật chốt trước: cần ≥ 20 mẫu có nhãn khác "đi ngang" (hiện 2) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lớp đang đo BÓNG: đà riêng trong nước (ngày đầu)

Chỉ ĐO, dự đoán không dùng: cộng 0,5 × trung bình phần lệch (giá thật − giá dự đoán) của 20 mốc đã chấm liền trước vào dự đoán ngày đầu.
Trên 3 mốc từ ngày 17/11/2026: sai số TB thật **1.303 đ**, nếu áp thêm lớp này **1.065 đ**.
Cả sổ (33 mốc, gồm những mốc đã dùng lúc chọn lớp — không dùng để kết luận): 527 đ so với 489 đ nếu áp.
Luật chốt trước: cần ≥ 20 mốc từ ngày 17/11/2026 (hiện 3) rồi mới xét. Chưa đủ cơ sở để bàn đưa vào dự đoán.

### Lời đầu: dự đoán lúc giá vừa về, sàn London chưa có phiên mới

Từ `tv-close-gemini-v9` bản này lấy mức sàn DỰ ĐOÁN thay cho "đứng yên vì sàn chưa đi thêm". Trên 5 mốc: sai số TB **1.531 đ**, đoán đứng yên **1.600 đ**, đúng chiều 80%; lời cuối (sáng hôm sau, sàn đã đi thật) của chính các mốc đó **1.049 đ**.
Luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 5) rồi mới kết luận.

### Phân loại lỗi ngày-1

- đúng chiều, vừa: 18 lần
- đúng chiều, non tay: 9 lần
- bỏ lỡ cú đi: 6 lần
- đứng yên, đoán đứng yên: 6 lần
- đúng chiều, quá tay: 5 lần
- đoán cú đi không xảy ra: 5 lần
- bỏ lỡ cú đi lớn: 2 lần
- ngược chiều: 2 lần

Tỷ lệ truyền dẫn thực (giá trong nước chép bao nhiêu phần cú đi của sàn London, trung vị trên 36 ngày sàn đi ≥ +0,50%): **0,51**.

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). giữ 0,5: tốt nhất trên lưới là 0,5 (MAE 473 so với 473) nhưng chưa vượt ngưỡng cải thiện 3%.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 546 đ |
| 0,4 | 499 đ |
| 0,5 | 473 đ |
| 0,6 | 502 đ |
| 0,7 | 548 đ |
| 0,8 | 605 đ |

### Năm lỗi lớn nhất và lý do

- **18/11/2026** (mốc 17/11/2026), sai 1.872 đ:
  - Đúng chiều, non tay: giá đi −2.800 đ, dự đoán −928 đ.
  - Lớp truyền dẫn London đúng chiều (−928 đ), bớt được 928 đ sai số.
  - Giá trong nước chép 1,51 lần cú đi −2,32% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **03/11/2026** (mốc 02/11/2026), sai 1.654 đ:
  - Ngược chiều: giá đi −1.200 đ, dự đoán +454 đ.
  - Lớp truyền dẫn London kéo sai chiều (+492 đ), làm sai số tăng 492 đ.
  - Giá trong nước chép -1,22 lần cú đi +1,15% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **19/11/2026** (mốc 18/11/2026), sai 1.547 đ:
  - Đúng chiều, non tay: giá đi −2.200 đ, dự đoán −653 đ.
  - Lớp truyền dẫn London đúng chiều (−653 đ), bớt được 653 đ sai số.
  - Giá trong nước chép 1,69 lần cú đi −1,69% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **17/11/2026** (mốc 16/11/2026), sai 1.158 đ:
  - Đúng chiều, non tay: giá đi −2.000 đ, dự đoán −842 đ.
  - Lớp truyền dẫn London đúng chiều (−842 đ), bớt được 842 đ sai số.
  - Giá trong nước chép 1,50 lần cú đi −1,63% của sàn (hệ số truyền dẫn đang dùng 0,5).
- **16/11/2026** (mốc 14/11/2026), sai 1.075 đ:
  - Bỏ lỡ cú đi lớn: giá đi −1.000 đ, dự đoán +75 đ.
  - Lớp truyền dẫn London kéo sai chiều (+182 đ), làm sai số tăng 182 đ.
  - Mốc và ngày chấm cách nhau 2 ngày (nguồn nghỉ).

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 53 | 432 đ | 698 đ | 74% | 92% |
| Lâm Đồng | 53 | 428 đ | 706 đ | 74% | 92% |
| Gia Lai | 53 | 437 đ | 698 đ | 70% | 92% |
| Đắk Nông | 53 | 446 đ | 713 đ | 72% | 92% |
| Robusta London | 50 | 38 USD | 43 USD | 56% | 96% |
| Arabica New York | 50 | 100 USD | 105 USD | 62% | 94% |

## Dự đoán sàn TRƯỚC PHIÊN (lời đầu của hai chuỗi sàn)

Bản dựng lúc bảng sàn vừa sang ngày, phiên tối nay chưa mở: chỉ có tín hiệu TradingView. Lời cuối (sáng hôm sau) lấy giá sàn đã chốt nên gần như đúng tuyệt đối — cột cuối để thấy phần chênh là thứ chỉ biết được khi phiên đã chạy.

| Chuỗi | Số mốc | Trước phiên: sai số TB | Đứng yên | Đúng chiều | Lời cuối |
|---|---|---|---|---|---|
| Robusta London | 6 | 41 USD | 47 USD | 100% | 8 USD |
| Arabica New York | 6 | 69 USD | 62 USD | 17% | 16 USD |

- Robusta London: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 6) rồi mới kết luận.
- Arabica New York: luật chốt trước: cần ≥ 20 mốc đã chấm (hiện 6) rồi mới kết luận.

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
