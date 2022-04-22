class Task < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 30}
    validate :validates_naame_not_including_comma

    private

    def validates_naame_not_including_comma
        errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
        # 検証エラーの詳細をerrors.addで格納している
        # &.= nameがnilのときには検証を通る（errors.addしない）ようにしている
        # ちなみに、nameの必須チェックの方に引っかかるので、最終的には検証エラーが発生する
    end
end
