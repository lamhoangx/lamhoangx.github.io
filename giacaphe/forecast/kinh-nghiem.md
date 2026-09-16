# Sổ học kinh nghiệm dự đoán giá cà phê

Cập nhật: 16/09/2026 07:48. Sổ giữ 60 ngày mốc gần nhất; mọi con số đo trên giá THẬT đã về, không con số nào do mô hình ngôn ngữ viết. Sai số tính bằng đ/kg (nội địa) hoặc USD/tấn (thế giới).

Đây là sổ nội bộ để cải thiện mô hình — không phải khuyến nghị mua bán.

## Trung bình 4 tỉnh

Đã ghi 2 mốc dự đoán, 1 mốc đã có giá thật để chấm.

### Sai số theo tầm dự đoán

| Tầm (ngày) | Số lần | Sai số TB | Đứng yên | Dải 90% phủ |
|---|---|---|---|---|
| 1 | 1 | 178 đ | 200 đ | 100% |

### Ngày-1: mô hình so với đứng yên

Trên 1 lần đo: sai số TB **178 đ**, đứng yên **200 đ**, đúng chiều 100%, dải 90% phủ 100%.
→ Mô hình **đang thắng** mốc đứng yên (−22 đ).

### Từng lớp giúp hay hại (ngày-1)

| Lớp | Có tiếng nói | Đúng chiều | Nếu bỏ lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| truyền dẫn London | 1 | 100% | 314 đ | giúp (+136 đ) |
| tín hiệu sàn | 0 | — | 178 đ | chưa có tiếng nói |
| xu hướng gần | 0 | — | 178 đ | chưa có tiếng nói |
| AI điều tiết | 1 | 0% | 63 đ | hại (−115 đ) |

### Từng lớp AI riêng (ngày-1)

| Lớp AI | Có tiếng nói | Đúng chiều | Nếu bỏ riêng lớp, sai số TB | Kết luận |
|---|---|---|---|---|
| tâm lý bản tin | 1 | 0% | 140 đ | hại (−38 đ) |
| đề xuất lệch sàn | 0 | — | 178 đ | chưa có tiếng nói |
| cung–cầu thế giới (GLM) | 1 | 0% | 102 đ | hại (−76 đ) |

### GLM theo đồng thuận kỹ thuật–tin

| Đồng thuận | Số lần | Sai số TB | Nếu bỏ GLM |
|---|---|---|---|
| không rõ | 1 | 178 đ | 102 đ |

Luật chốt trước: cần ≥ 20 mẫu "ngược chiều" (hiện 0) rồi mới xét hạ trọng số GLM ở nhóm đó.

### Phân loại lỗi ngày-1

- bỏ lỡ cú đi: 1 lần

### Hiệu chỉnh hệ số truyền dẫn (beta)

Đang dùng **beta 0,5** (mặc định 0,5). chưa đủ mẫu (1/20) — dùng beta mặc định 0,5.

| beta | Sai số TB nếu dùng |
|---|---|
| 0,3 | 200 đ |
| 0,4 | 200 đ |
| 0,5 | 178 đ |
| 0,6 | 151 đ |
| 0,7 | 124 đ |
| 0,8 | 96 đ |

### Năm lỗi lớn nhất và lý do

- **15/09/2026** (mốc 14/09/2026), sai 178 đ:
  - Bỏ lỡ cú đi: giá đi +200 đ, dự đoán +22 đ.
  - Lớp truyền dẫn London đúng chiều (+136 đ), bớt được 136 đ sai số.
  - Lớp AI điều tiết kéo sai chiều (−115 đ), làm sai số tăng 115 đ.

## Các chuỗi khác — ngày-1

| Chuỗi | Số lần | Sai số TB | Đứng yên | Đúng chiều | Dải 90% phủ |
|---|---|---|---|---|---|
| Đắk Lắk | 1 | 180 đ | 200 đ | 100% | 100% |
| Lâm Đồng | 1 | 178 đ | 200 đ | 100% | 100% |
| Gia Lai | 1 | 180 đ | 200 đ | 100% | 100% |
| Đắk Nông | 1 | 175 đ | 200 đ | 100% | 100% |
| Robusta London | 1 | 6 USD | 10 USD | 100% | 100% |
| Arabica New York | 1 | 114 USD | 139 USD | 100% | 100% |

## Cách đọc

- **Đứng yên** là sai số nếu chỉ đoán "ngày mai bằng hôm nay" — mốc đối chứng khó thắng nhất. Mô hình phải thắng cột này mới đáng giữ.
- **Nếu bỏ lớp** là sai số trung bình khi trừ phần đóng góp của lớp đó ra khỏi dự đoán, tính trên đúng đầu vào đã ghi lúc dự đoán. Lớn hơn sai số thật nghĩa là lớp đó đang giúp.
- **Dải 90% phủ** là tỷ lệ ngày giá thật rơi trong dải thấp–cao mô hình vẽ. Mục tiêu ~90%: thấp hơn nhiều là dải đang hẹp hơn sự thật.
- Hiệu chỉnh beta theo luật chốt trước: cần ≥ 20 mẫu có truyền dẫn, beta mới phải giảm sai số ≥ 3% so với beta đang dùng, và chỉ chọn trong lưới 0,3, 0,4, 0,5, 0,6, 0,7, 0,8.
