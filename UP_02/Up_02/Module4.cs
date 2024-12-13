using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UP_02.Model;

namespace UP_02.Up_02
{
    class Module4
    {
        public static int MaterialDeffect(int productId, int materialType, int quantity, double par1, double par2)
        {
            double result;
            var TypeProduct = Entities.GetContext().ProductType.Where(x => x.Id == productId);
            var typeMaterial = Entities.GetContext().MaterialType.Where(x => x.Id == materialType);
            if (TypeProduct.Count() < 1 | typeMaterial.Count() < 1 | quantity < 1 | par1 <= 0 | par2 <= 0)
                return -1;
            else
            {
                double coeff = TypeProduct.Select(x => x.Coefficient).FirstOrDefault();
                double materCount = quantity+ quantity * typeMaterial.Select(x => x.DefectPercent).FirstOrDefault();
                result = materCount * par1 * par2 * coeff;
                return (int)Math.Ceiling(result);
            }
            
        }
        
    }
}
