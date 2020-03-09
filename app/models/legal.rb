class Legal < ApplicationRecord
  # enum title: { contact: 0, terms: 1, privacy: 2, whoami: 3, gallery: 4 }
  has_rich_text :content
end
